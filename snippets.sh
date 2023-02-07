USER_PEM="~/wallets/development.pem"
PROXY="https://devnet-gateway.elrond.com"
CHAIN_ID="D"

deploy() {
    erdpy --verbose contract deploy --project=${PROJECT} \
    --recall-nonce --pem=${USER_PEM} \
    --gas-limit=59999999 \
    --send --outfile="deploy.interaction.json" \
    --proxy=${PROXY} --chain=${CHAIN_ID} || return
}

upgrade() {
    erdpy --verbose contract upgrade erd1qqqqqqqqqqqqqpgq6u7pd47w4wy9dc5m9ax28vg3mggec63l4jwsdukkjq --project=${PROJECT} \
    --recall-nonce --pem=${USER_PEM} \
    --gas-limit=50000000 \
    --send --outfile="deploy.interaction.json" \
    --proxy=${PROXY} --chain=${CHAIN_ID} || return
}

upgrade_devnet() {
    erdpy --verbose contract upgrade erd1qqqqqqqqqqqqqpgq7qdqsuq4a4pga2hxa5h0gvluf7hlc6hndn3q32jth5 --project=${PROJECT} \
    --recall-nonce \
    --ledger --ledger-address-index 3 \
    --gas-limit=50000000 \
    --send --outfile="deploy.interaction.json" \
    --proxy="https://devnet-gateway.elrond.com" --chain=D || return
}
upgrade_testnet() {
    erdpy --verbose contract upgrade erd1qqqqqqqqqqqqqpgq5j3wahajwehwja70v39074zzzjsq89lkdn3qp3j2f9 --project=${PROJECT} \
    --recall-nonce \
    --ledger --ledger-address-index 3 \
    --gas-limit=50000000 \
    --send --outfile="deploy.interaction.json" \
    --proxy="https://testnet-gateway.elrond.com" --chain=T || return
}
upgrade_mainnet() {
    erdpy --verbose contract upgrade erd1qqqqqqqqqqqqqpgq5j3wahajwehwja70v39074zzzjsq89lkdn3qp3j2f9 --project=${PROJECT} \
    --recall-nonce \
    --ledger --ledger-address-index 3 \
    --gas-limit=50000000 \
    --send --outfile="deploy.interaction.json" \
    --proxy="https://gateway.elrond.com" --chain=1 || return
}