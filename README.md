# xBulk (Previously Elrond Bulk)

The fastest and easiest way to send bulk transactions on the MultiversX blockchain.

Insert the list of transactions and send EGLD or ESDTs to thousands of wallets in seconds, without programming knowledge and using your preferred login method with maximum security, without having to save a key for your wallet.

## How to use

### Easy way

The tool is live at https://xbulk.app

You can login using your preferred login method, insert the list of transactions to send (it's also possible to upload a CSV file) and sign your transaction.

When sending more than 400 transactions you will need to sign multiple SC calls in order to avoid having gas issues.

Note: due to technical limitations you can't send more than 80 transactions when logging with Web Wallet.

### Advanced way

You can send transactions directly to our smart contract to integrate with your application.

The smart contract is deployed at the following address:

#### Mainnet & Testnet:

```
erd1qqqqqqqqqqqqqpgq5j3wahajwehwja70v39074zzzjsq89lkdn3qp3j2f9
```

#### Devnet:

```
erd1qqqqqqqqqqqqqpgq7qdqsuq4a4pga2hxa5h0gvluf7hlc6hndn3q32jth5
```

To send bulk transactions, just send a transaction to the above address with the addresses and amounts to send.

```
bulksend@address1@amount1@address2@amount2@addressN@amountN
```

Example:

Sending 1.2 EGLD to erd1deaddeaddeaddeaddeaddeaddeaddeaddeaddeaddeaddeaddeaqtv0gag

Transaction data field:

```
bulksend@6e7ad6e7ad6e7ad6e7ad6e7ad6e7ad6e7ad6e7ad6e7ad6e7ad6e7ad6e7ad6e7a@10a741a462780000
```

Note that the address is converted in HEX and the amount is converted to its [denominated value](https://docs.elrond.com/developers/signing-transactions/signing-transactions/).

You can also send ESDTs for bulk transactions. Example:

Sending 1.2 WEB-5d08be to erd1deaddeaddeaddeaddeaddeaddeaddeaddeaddeaddeaddeaddeaqtv0gag

Transaction data field:

```
MultiESDTNFTTransfer@00000000000000000500a4a2eedfb2766ee977cf644aff544214a00397f66ce2@01@5745422d356430386265@@10a741a462780000@62756c6b73656e64@6e7ad6e7ad6e7ad6e7ad6e7ad6e7ad6e7ad6e7ad6e7ad6e7ad6e7ad6e7ad6e7a@10a741a462780000
```

# Draws

xBulk also allows to make the draws for your giveaways in the most trasparent and easy way!

Insert the list of the partecipants and the prizes you want to send, the smart contract will extract the list of winners and send them the prizes automatically.

# Contact us

You can get in touch with us in our [Telegram Chat](https://t.me/tortugastaking)

Made with ❤️ by DefralCoding & Tortuga Staking.
