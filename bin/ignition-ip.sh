#!/bin/bash

BASE=$HOME/ocpinstall/bootstrap
DOMAIN=azgov.rhocp.us

if [[ $# < 4 ]]; then
  echo usage: $0 ocpinst ip hostname role > /dev/stderr
  exit 1
fi

INST="$1"
IP="$2"
HNAME="$3"
ROLE="$4"

cat <<! > $BASE/etc/sysconfig/network-scripts/ifcfg-eth0
BOOTPROTO=none
ONBOOT=yes
DEVICE=eth0
MODE=managed
MANAGED=yes
IPADDR=$IP
NETMASK=255.255.255.0
GATEWAY=10.0.0.1
DNS1=10.0.0.4
DNS2=
DOMAIN=azgov.rhocp.us
PREFIX=24
DEFROUTE=yes
IPV6INIT=no
!

echo -n $HNAME.$DOMAIN > $BASE/etc/hostname

filetranspile -i $INST/${ROLE}.ign -f bootstrap -o $HNAME-static.ign
