#!/bin/bash
set -e

geth --datadir=$DATADIR init "/root/files/genesis.json"

sleep 3

BOOTSTRAP_IP=`getent hosts bootstrap | cut -d" " -f1`

GETH_OPTS=${@/XXX/$BOOTSTRAP_IP}
