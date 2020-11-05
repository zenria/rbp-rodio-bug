#!/bin/bash
set -eux
scp target/arm-unknown-linux-gnueabihf/debug/rbp-rodio-bug philou@elise-rbp-mini:rbp-rodio-bug-dbg
ssh philou@elise-rbp-mini "./rbp-rodio-bug-dbg"
