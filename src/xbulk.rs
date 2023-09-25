#![no_std]

use core::ops::Deref;
multiversx_sc::imports!();
multiversx_sc::derive_imports!();

#[derive(ManagedVecItem)]
pub struct DestAmountPair<M: ManagedTypeApi> {
    pub dest: ManagedAddress<M>,
    pub amount: BigUint<M>,
}

#[multiversx_sc::derive::contract]
pub trait XBulk: multiversx_sc_modules::dns::DnsModule {
    #[init]
    fn init(&self, new_owner: OptionalValue<ManagedAddress>) {
        match new_owner {
            OptionalValue::Some(o) => {
                let _ = self.owners().insert(o);
            }
            OptionalValue::None => {
                let sc_owner = self.blockchain().get_caller();
                let _ = self.owners().insert(sc_owner);
            }
        }
    }

    #[view(getOwners)]
    #[storage_mapper("owners")]
    fn owners(&self) -> UnorderedSetMapper<ManagedAddress>;

    #[only_owner]
    #[endpoint(addOwner)]
    fn add_owner(&self, new_owner: ManagedAddress) {
        let _ = self.owners().insert(new_owner);
    }

    #[payable("*")]
    #[endpoint(bulkSend)]
    fn bulk_send(&self, destinations: MultiValueEncoded<MultiValue2<ManagedAddress, BigUint>>) {
        self.require_owner();

        let payment = self.call_value().egld_or_single_esdt();

        let mut amount_to_spend = BigUint::zero();
        let mut dest_amount_pairs = ManagedVec::<Self::Api, DestAmountPair<Self::Api>>::new();
        for destination in destinations {
            let (address_to_send, amount_to_send) = destination.into_tuple();
            amount_to_spend += &amount_to_send;

            dest_amount_pairs.push(DestAmountPair {
                dest: address_to_send,
                amount: amount_to_send,
            });
        }

        require!(
            payment.amount == amount_to_spend,
            "The sent amount must be equal to the sum of each transaction you want to send"
        );

        for pair in &dest_amount_pairs {
            self.send().direct(
                &pair.dest,
                &payment.token_identifier,
                payment.token_nonce,
                &pair.amount,
            );
        }
    }

    #[payable("*")]
    #[endpoint(bulkSendSameAmount)]
    fn bulk_send_same_amount(&self, destinations: MultiValueEncoded<ManagedAddress>) {
        self.require_owner();

        let payment = self.call_value().egld_or_single_esdt();
        let amount_to_send = payment.amount / (destinations.len() as u64);

        for destination in destinations {
            self.send().direct(
                &destination,
                &payment.token_identifier,
                payment.token_nonce,
                &amount_to_send,
            );
        }
    }

    #[endpoint]
    #[payable("*")]
    fn draw(
        &self,
        participants: MultiValueEncoded<ManagedAddress>,
    ) -> MultiValueEncoded<ManagedAddress> {
        self.require_owner();

        let payments = self.call_value().all_esdt_transfers();

        let mut part_vecs = participants.to_vec();
        let mut rand_source = RandomnessSource::new();

        let mut winners: ManagedVec<ManagedAddress> = ManagedVec::new();

        for payment in payments.deref() {
            // draw a winner
            let winner_index = rand_source.next_usize_in_range(0, part_vecs.len());
            let winner_item = part_vecs.get(winner_index);
            let winner = winner_item.deref().clone();

            // send the token to the winner
            self.send().direct_esdt(
                &winner,
                &payment.token_identifier,
                payment.token_nonce,
                &payment.amount,
            );

            // add the winner to the winners array
            winners.push(winner);

            //remove the winner from the participants
            part_vecs.remove(winner_index);
        }

        winners.into()
    }

    #[payable("*")]
    #[endpoint(nftDistribution)]
    fn nft_distribution(&self, destinations: MultiValueEncoded<ManagedAddress>) {
        self.require_owner();

        let payments = self.call_value().all_esdt_transfers();
        require!(
            payments.len() == destinations.len(),
            "The number of NFTs must be equal to the number of destinations"
        );

        for (dest, payment) in destinations.into_iter().zip(payments.iter()) {
            // send the token to the winner
            self.send().direct_esdt(
                &dest,
                &payment.token_identifier,
                payment.token_nonce,
                &payment.amount,
            );
        }
    }

    fn require_owner(&self) {
        let caller = self.blockchain().get_caller();
        require!(
            self.owners().contains(&caller),
            "You are not allowed to call this method on this contract"
        );
    }
}
