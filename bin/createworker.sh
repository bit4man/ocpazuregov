#!/bin/bash 

if [[ $# < 5 ]]; then
  echo "usage: $0 vname shim subnet nsg ip [availability-group]" > /dev/stderr
  echo "Use AZ names for the components." > /dev/stderr
  echo "nsg: Network Security Group" > /dev/stderr
  echo "ip: Last octet of IP address" > /dev/stderr
  exit 1 
fi

SUBNET="10.0.1"

vmname="$1"
shim="$2"
subnet="$3"
nsg="$4"
ip="$5"
avail="$6"
av=""

for a in $(seq 1 9); do
  echo -n "Parameter $a "
  echo -n '"'
  eval 'echo -n $'$a
  echo  '"'
done


if [[ "$avail" != "" ]]; then
  echo Availability Set .... set?
  av="--availability-set=$avail"
  echo to.... "$av"
fi

az network nic create -n "${vmname}-eth0" -g RGroupVA --subnet "$subnet" --dns-servers 10.0.0.4 --network-security-group "$nsg" --private-ip-address "${SUBNET}.$ip" --public-ip-address "" --vnet-name ocp4

if [[ $? == 0 ]]; then

az vm create --name "$vmname" --resource-group RGroupVA $av --admin-username core --custom-data "$shim" --image rhcos --boot-diagnostics-storage rhstorage --ssh-key-values $HOME/.ssh/id_ose.pub --os-disk-size-gb 50 --storage-sku StandardSSD_LRS --nics "${vmname}-eth0" --size Standard_D4_v3 --verbose --no-wait

fi

