#![no_std]

use core::ops::Deref;
elrond_wasm::imports!();

#[elrond_wasm::derive::contract]
pub trait ElrondBulk: elrond_wasm_modules::dns::DnsModule {
    #[init]
    fn init(&self) {}

    #[payable("*")]
    #[endpoint]
    fn bulksend(
        &self,
        #[payment_token] payment_token: EgldOrEsdtTokenIdentifier,
        #[payment_amount] payment_amount: BigUint,
        #[payment_nonce] nonce: u64,
        destinations: MultiValueEncoded<MultiValue2<ManagedAddress, BigUint>>,
    ) {
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

    #[endpoint]
    #[payable("*")]
    fn draw(
        &self,
        #[payment_multi] payments: ManagedVec<EsdtTokenPayment<Self::Api>>,
        participants: MultiValueEncoded<ManagedAddress>,
    ) {
        let mut rand_source = RandomnessSource::<Self::Api>::new();

        for payment in &payments {
            let rand_index = rand_source.next_usize_in_range(0, participants.len());
            let part_vecs = participants.to_vec();
            let winner_item = part_vecs.get(rand_index);
            let winner = winner_item.deref().clone();

            let token_payment = EgldOrEsdtTokenPayment::from(payment);

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
        #[payment_multi] payments: ManagedVec<EsdtTokenPayment<Self::Api>>,
        destinations: MultiValueEncoded<ManagedAddress>,
    ) {
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

    #[payable("*")]
    #[endpoint(bulksendSameAmount)]
    fn bulksend_same_amount(
        &self,
        #[payment_token] payment_token: EgldOrEsdtTokenIdentifier,
        #[payment_amount] payment_amount: BigUint,
        #[payment_nonce] nonce: u64,
        destinations: MultiValueEncoded<ManagedAddress>,
    ) {
        let amount_to_send = payment_amount / BigUint::from(destinations.len() as u64);

        for destination in destinations {
            self.send()
                .direct(&destination, &payment_token, nonce, &amount_to_send);
        }
    }
}
