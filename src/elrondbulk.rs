#![no_std]

elrond_wasm::imports!();

#[elrond_wasm::derive::contract]
pub trait ElrondBulk {
    
    #[init]
    fn init(&self) { }
    
    #[payable("*")]
    #[endpoint]
    fn bulksend(
        &self,
        #[payment_token] payment_token: TokenIdentifier,
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
            self.send().direct(&address_to_send, &payment_token, nonce, &amount_to_send, b"");
        }

    }

}
