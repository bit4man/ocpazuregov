#!/bin/bash

INST="$1"

bin/ignition-ip.sh ${INST} 10.0.0.5 bootstrap bootstrap
bin/ignition-ip.sh ${INST} 10.0.0.10 master1 master
bin/ignition-ip.sh ${INST} 10.0.0.11 master2 master
bin/ignition-ip.sh ${INST} 10.0.0.12 master3 master
bin/ignition-ip.sh ${INST} 10.0.0.20 node1 worker
bin/ignition-ip.sh ${INST} 10.0.0.21 node2 worker
bin/ignition-ip.sh ${INST} 10.0.0.22 node3 worker

