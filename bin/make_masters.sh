#!/bin/bash
OCP=$HOME/ocpinstall

$OCP/bin/createvm.sh azgov-master1 shim/master1-ignition.json control control 10
$OCP/bin/createvm.sh azgov-master2 shim/master2-ignition.json control control 11
$OCP/bin/createvm.sh azgov-master3 shim/master3-ignition.json control control 12
