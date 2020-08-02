#!/bin/bash

nohup $HOME/shinecloudnet-binary/shinecloudnet-mainnet/binary/v1.2.0/scloudcli rest-server --node 3.112.87.138:26657 --laddr tcp://0.0.0.0:1317 --chain-id shinecloudnet --trust-node > shinecloudnet_lcd.log 2>&1 &