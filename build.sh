export PROJECT=~/programmazione/DefralCoding/xBulk
export BUILD_OUTPUT=~/programmazione/DefralCoding/xBulk/output
export IMAGE=multiversx/sdk-rust-contract-builder:v4.1.2

python3 build_with_docker.py --image="multiversx/sdk-rust-contract-builder:v4.1.2" \
    --project="~/Documents/programmazione/DefralCoding/xBulk" \
    --output="~/Documents/programmazione/DefralCoding/xBulk/output"