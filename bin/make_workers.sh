#!/bin/bash
OCP=$HOME/ocpinstall

$OCP/bin/createworker.sh azgov-node1 shim/node1-ignition.json worker worker 20
$OCP/bin/createworker.sh azgov-node2 shim/node2-ignition.json worker worker 21
$OCP/bin/createworker.sh azgov-node3 shim/node3-ignition.json worker worker 22
