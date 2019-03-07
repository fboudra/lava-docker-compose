#!/bin/sh

# Idempotentally provision users and devices in lava

set -ex

lava-server manage users list | grep -q admin || \
    lava-server manage users add --staff --superuser --email admin@example.com --passwd admin admin

lava-server manage device-types list | grep -q qemu || \
    lava-server manage device-types add qemu

# It requires the dispatcher to be up and running
#lava-server manage devices list | grep -q qemu-01 || \
#    lava-server manage devices add --device-type qemu --worker dispatcher qemu-01
