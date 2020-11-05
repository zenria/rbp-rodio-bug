
@_usage:
    just -l

check:
    cross check --target arm-unknown-linux-gnueabihf

build_rbpmini:
    cross build --target arm-unknown-linux-gnueabihf --release

dbg_build_rbpmini:
    cross build --target arm-unknown-linux-gnueabihf

deploy_elise: build_rbpmini
    misc/deploy.sh

dbg_deploy_elise: dbg_build_rbpmini
    misc/dbgdeploy.sh
