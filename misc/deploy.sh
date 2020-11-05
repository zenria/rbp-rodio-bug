#!/bin/bash
set -eux
scp target/arm-unknown-linux-gnueabihf/release/rbp-rodio-bug philou@elise-rbp-mini:
ssh philou@elise-rbp-mini "sudo ./rbp-rodio-bug"
