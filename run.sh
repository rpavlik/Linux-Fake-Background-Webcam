#!/bin/bash
# Copyright 2020, Collabora, Ltd.
# SPDX-License-Identifier: GPL-3.0-or-later

(
    cd $(dirname $0)
    cd bodypix
    ./app.js &
    JS=$!
    echo "bodypix pid is $JS"
    sleep 2
    cd ../fakecam
    set -x
    ./fake.py "$@"
    
    # when ctrl-c is pressed in python, that will also kill node.
)
