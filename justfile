
@_usage:
    just -l

check:
    cross check --target arm-unknown-linux-gnueabihf

build_rbpmini:
    cross build --target arm-unknown-linux-gnueabihf --release

deploy_elise: build_rbpmini
    misc/deploy.sh

