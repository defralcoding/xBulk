#![no_std]

use core::ops::Deref;
multiversx_sc::imports!();

#[multiversx_sc::derive::contract]
pub trait XBulk: multiversx_sc_modules::dns::DnsModule {
    #[init]
    fn init(&self, new_owner: OptionalValue<ManagedAddress>) {
        if let Some(o) = new_owner.into_option() {
            self.owners().insert(o);
        }
    }

    #[view(getOwners)]
    #[storage_mapper("owners")]
    fn owners(&self) -> UnorderedSetMapper<ManagedAddress>;

    #[only_owner]
    #[endpoint(addOwner)]
    fn add_owner(&self, new_owner: ManagedAddress) {
        require!(
            !self.owners().contains(&new_owner),
            "The address is already an owner"
        );
        self.owners().insert(new_owner);
    }

    fn require_owner(&self) {
        let owners = self.owners();
        if !owners.is_empty() {
            require!(
                owners.contains(&self.blockchain().get_caller()),
                "You are not allowed to call this method on this contract"
            );
        }
    }

    #[payable("*")]
    #[endpoint]
    fn bulksend(
        &self,
        #[payment_token] payment_token: EgldOrEsdtTokenIdentifier,
        #[payment_amount] payment_amount: BigUint,
        #[payment_nonce] nonce: u64,
        destinations: MultiValueEncoded<MultiValue2<ManagedAddress, BigUint>>,
    ) {
        self.require_owner();

        let mut amount_to_spend = BigUint::from(0u64);

        for destination in destinations.clone() {
            let (_address_to_send, amount_to_send) = destination.into_tuple();
            amount_to_spend += &amount_to_send;
        }

        require!(
            payment_amount == amount_to_spend,
            "The sent amount must be equal to the sum of each transaction you want to send"
        );

        for destination in destinations {
            let (address_to_send, amount_to_send) = destination.into_tuple();
            self.send()
                .direct(&address_to_send, &payment_token, nonce, &amount_to_send);
        }
    }

    #[payable("*")]
    #[endpoint(bulksendSameAmount)]
    fn bulksend_same_amount(
        &self,
        #[payment_token] payment_token: EgldOrEsdtTokenIdentifier,
        #[payment_amount] payment_amount: BigUint,
        #[payment_nonce] nonce: u64,
        destinations: MultiValueEncoded<ManagedAddress>,
    ) {
        self.require_owner();

        let amount_to_send = payment_amount / BigUint::from(destinations.len() as u64);

        for destination in destinations {
            self.send()
                .direct(&destination, &payment_token, nonce, &amount_to_send);
        }
    }

    #[endpoint]
    #[payable("*")]
    fn draw(
        &self,
        participants: MultiValueEncoded<ManagedAddress>,
        #[payment_multi] payments: ManagedRef<'static, ManagedVec<EsdtTokenPayment<Self::Api>>>,
    ) {
        self.require_owner();

        let part_vecs = participants.to_vec();
        let mut rand_source = RandomnessSource::new();

        let mut winners: ManagedVec<ManagedAddress> = ManagedVec::new();

        for payment in payments.deref() {
            let token_payment = EgldOrEsdtTokenPayment::from(payment);

            //draw until we find a winner that has not already won
            let mut winner_item =
                part_vecs.get(rand_source.next_usize_in_range(0, participants.len()));
            while winners.contains(&winner_item) {
                winner_item = part_vecs.get(rand_source.next_usize_in_range(0, participants.len()));
            }

            let winner = winner_item.deref().clone();

            //add the winner to the winners array
            winners.push(winner.clone());

            //send the token to the winner
            self.send().direct(
                &winner,
                &token_payment.token_identifier,
                token_payment.token_nonce,
                &token_payment.amount,
            );
        }
    }

    #[payable("*")]
    #[endpoint(nftDistribution)]
    fn nft_distribution(
        &self,
        destinations: MultiValueEncoded<ManagedAddress>,
        #[payment_multi] payments: ManagedRef<'static, ManagedVec<EsdtTokenPayment<Self::Api>>>,
    ) {
        self.require_owner();

        require!(
            payments.len() == destinations.len(),
            "The number of NFTs must be equal to the number of destinations"
        );

        let destinations_vec = destinations.to_vec();

        for i in 0..payments.len() {
            let payment = payments.get(i);
            let destination = destinations_vec.get(i);

            let token_payment = EgldOrEsdtTokenPayment::from(payment);

            self.send().direct(
                &destination,
                &token_payment.token_identifier,
                token_payment.token_nonce,
                &token_payment.amount,
            );
        }
    }
}
