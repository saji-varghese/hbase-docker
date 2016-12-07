#!/bin/bash

start-hbase.sh

if [ -t 0 ]; then
    hbase shell
fi

tail -F /var/log/ &