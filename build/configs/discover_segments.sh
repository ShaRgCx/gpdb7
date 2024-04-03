#!/bin/bash

export NAME=sdw

echo $(hostname) > /tmp/gpdb-hosts

for S in `seq 1 9`
do
 echo ${NAME}_1
 ping -c 1 ${NAME}${S}_1
 if [[ $? == 0 ]]; then
  echo "Adding ${NAME}${S}_1"
  echo ${NAME}${S}_1 >> /tmp/gpdb-hosts
  ssh -o StrictHostKeyChecking=no ${NAME}${S}_1 uptime
  echo Host ${NAME}${S} $'\n' HostName ${NAME}${S}_1 $'\n\n' >> ~/.ssh/config
 else
  echo "."
 fi
done

exit 0
