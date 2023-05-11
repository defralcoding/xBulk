USER_PEM="~/wallets/development.pem"
PROXY="https://devnet-gateway.multiversx.com"
CHAIN_ID="D"

CONTRACT_ADDRESS="erd1qqqqqqqqqqqqqpgqt9ldfqyctu5v8kk8ypedlx0vjxk9u3we4jws70wdch"

deploy() {
    mxpy --verbose contract deploy --bytecode="output/xbulk/xbulk.wasm" \
    --recall-nonce \
    --pem=${USER_PEM} \
    --gas-limit=40000000 \
    --send \
    --proxy=${PROXY} --chain=${CHAIN_ID} || return
}

upgrade() {
    mxpy --verbose contract upgrade ${CONTRACT_ADDRESS} --project=${PROJECT} \
    --recall-nonce --pem=${USER_PEM} \
    --gas-limit=50000000 \
    --send \
    --proxy=${PROXY} --chain=${CHAIN_ID} || return
}

getgenerico() {
    echo owners
    mxpy contract query ${CONTRACT_ADDRESS} \
    --function "getOwners" --proxy=${PROXY} || return
}

upgrade_devnet() {
    mxpy --verbose contract upgrade erd1qqqqqqqqqqqqqpgq7qdqsuq4a4pga2hxa5h0gvluf7hlc6hndn3q32jth5 --project=${PROJECT} \
    --recall-nonce \
    --ledger --ledger-address-index 3 \
    --gas-limit=50000000 \
    --send \
    --proxy="https://devnet-gateway.multiversx.com" --chain=D || return
}
upgrade_testnet() {
    mxpy --verbose contract upgrade erd1qqqqqqqqqqqqqpgq5j3wahajwehwja70v39074zzzjsq89lkdn3qp3j2f9 --project=${PROJECT} \
    --recall-nonce \
    --ledger --ledger-address-index 3 \
    --gas-limit=50000000 \
    --send \
    --proxy="https://testnet-gateway.multiversx.com" --chain=T || return
}

upgrade_mainnet_all() {
    mxpy --verbose contract upgrade erd1qqqqqqqqqqqqqpgqtnksqd6rs4a74mf4un5h2w2tt5lanfmaayxqs35jth --bytecode="output/xbulk/xbulk.wasm" \
    --recall-nonce \
    --ledger --ledger-address-index 3 \
    --gas-limit=40000000 \
    --send \
    --proxy="https://gateway.multiversx.com" --chain=1 

    sleep 10

    mxpy --verbose contract upgrade erd1qqqqqqqqqqqqqpgqwcv369k9x49ve3qlu0h5qe949w7m6gcxh42scqtdpf --bytecode="output/xbulk/xbulk.wasm" \
    --recall-nonce \
    --ledger --ledger-address-index 3 \
    --gas-limit=40000000 \
    --send \
    --proxy="https://gateway.multiversx.com" --chain=1 

    sleep 10

    mxpy --verbose contract upgrade erd1qqqqqqqqqqqqqpgq5j3wahajwehwja70v39074zzzjsq89lkdn3qp3j2f9 --bytecode="output/xbulk/xbulk.wasm" \
    --recall-nonce \
    --ledger --ledger-address-index 3 \
    --gas-limit=40000000 \
    --send \
    --proxy="https://gateway.multiversx.com" --chain=1 || return
}

verify_mainnet_all() {
    mxpy --verbose contract verify "erd1qqqqqqqqqqqqqpgqtnksqd6rs4a74mf4un5h2w2tt5lanfmaayxqs35jth" \
    --packaged-src=./output/xbulk/xbulk-1.0.0.source.json --verifier-url="https://play-api.multiversx.com" \
    --docker-image="multiversx/sdk-rust-contract-builder:v4.1.2" \
    --ledger --ledger-address-index 3

    mxpy --verbose contract verify "erd1qqqqqqqqqqqqqpgqwcv369k9x49ve3qlu0h5qe949w7m6gcxh42scqtdpf" \
    --packaged-src=./output/xbulk/xbulk-1.0.0.source.json --verifier-url="https://play-api.multiversx.com" \
    --docker-image="multiversx/sdk-rust-contract-builder:v4.1.2" \
    --ledger --ledger-address-index 3
    
    mxpy --verbose contract verify "erd1qqqqqqqqqqqqqpgq5j3wahajwehwja70v39074zzzjsq89lkdn3qp3j2f9" \
    --packaged-src=./output/xbulk/xbulk-1.0.0.source.json --verifier-url="https://play-api.multiversx.com" \
    --docker-image="multiversx/sdk-rust-contract-builder:v4.1.2" \
    --ledger --ledger-address-index 3 || return
}

claimrewards_mainnet_all() {
    mxpy --verbose contract call erd1qqqqqqqqqqqqqpgqtnksqd6rs4a74mf4un5h2w2tt5lanfmaayxqs35jth \
    --recall-nonce \
    --ledger --ledger-address-index 3 \
    --function="ClaimDeveloperRewards" \
    --gas-limit=6000000 \
    --send \
    --proxy="https://gateway.multiversx.com" --chain=1 

    sleep 10

    mxpy --verbose contract call erd1qqqqqqqqqqqqqpgqwcv369k9x49ve3qlu0h5qe949w7m6gcxh42scqtdpf \
    --recall-nonce \
    --ledger --ledger-address-index 3 \
    --function="ClaimDeveloperRewards" \
    --gas-limit=6000000 \
    --send \
    --proxy="https://gateway.multiversx.com" --chain=1 

    sleep 10

    mxpy --verbose contract call erd1qqqqqqqqqqqqqpgq5j3wahajwehwja70v39074zzzjsq89lkdn3qp3j2f9 \
    --recall-nonce \
    --ledger --ledger-address-index 3 \
    --function="ClaimDeveloperRewards" \
    --gas-limit=6000000 \
    --send \
    --proxy="https://gateway.multiversx.com" --chain=1 || return
}

upgrade_mainnet_2() {
    mxpy --verbose contract upgrade erd1qqqqqqqqqqqqqpgq5j3wahajwehwja70v39074zzzjsq89lkdn3qp3j2f9 --bytecode="output/xbulk/xbulk.wasm" \
    --recall-nonce \
    --ledger --ledger-address-index 3 \
    --gas-limit=40000000 \
    --send \
    --proxy="https://gateway.multiversx.com" --chain=1 || return
}

verify_mainnet_2() {
    mxpy --verbose contract verify "erd1qqqqqqqqqqqqqpgq5j3wahajwehwja70v39074zzzjsq89lkdn3qp3j2f9" \
    --packaged-src=./output/xbulk/xbulk-1.0.0.source.json --verifier-url="https://play-api.multiversx.com" \
    --docker-image="multiversx/sdk-rust-contract-builder:v4.1.2" \
    --ledger --ledger-address-index 3 || return
}