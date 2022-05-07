#!/bin/bash

apt-get update
apt-get install ssh -y

echo 'export my_root_password='${my_root_password} >> $HOME/.bashrc
echo 'export my_discord_id='${my_discord_id} >> $HOME/.bashrc
echo 'export my_wallet_privkey='${my_wallet_privkey} >> $HOME/.bashrc
echo 'export my_wallet_addr='${my_wallet_addr} >> $HOME/.bashrc
echo 'export MASSA_LINK='${MASSA_LINK} >> $HOME/.bashrc
echo 'export wait='${wait} >> $HOME/.bashrc
source $HOME/.bashrc

wget -O ./massa.tar.gz ${MASSA_LINK}
tar -xvf massa.tar.gz
sed -i 's/\r//' rolls.sh && chmod +x rolls.sh
echo '[bootstrap]
max_ping = 10000
   bootstrap_list = [
  ["5.161.61.192:31245", "7H8F9xh9ky2znDTi489fj7FgeKw8eqzArUoemick81SDD9U46z"],
  ["65.108.71.225:31245", "8MzrXnL6X7uhJyCpM9xQFmjnBepvwt9H4eSNZu1AVhDWYdyxci"],
  ["95.217.118.121:31245", "74CFJ3oF49fsMvLmaRvgf8Ydff6Rfnq96aitQTfoXvzN3pDFNU"],
  ["82.66.154.222:31245", "6FzHD3nA4Z2URYo9mM8qDgNFhekruK4Pr1cGzjNPrhKPw7mC2o"],
  ["158.69.23.120:31245", "8139kbee951YJdwK99odM7e6V3eW7XShCfX5E2ovG3b9qxqqrq"],
  ["49.12.237.242:31245", "84mLiQupTFNH4WY2c4jBP6ygLcQqsGm5x8VRW8vmR5evkMhwJz"],
  ["65.21.159.74:31245", "5a4qXAfdZyCcMFr2TUEYd2oTBoaF8KLBEM3uvAFLT7Jx3pSueP"],
  ["62.35.189.33:31245", "4zrk2uhdM39rK3VASyQNRLsXZS4CqHExiB6T4bNs3Rg1tuyaWg"],
  ["95.217.177.64:31245", "5J11NqbF4id4yNkLXadRnYN29eUwydYSbruXG4rGAy9Ai8Wkay"],
  ["198.27.74.5:31245", "6j68EAFjS6mc7kheMAXnPqbzrtCTQY8cZ45RomkEJx7PPQqYk7"],
  ["82.66.95.219:31245", "7hkdL6J4RZQufQ7stqAfSypYscNg6CarsfQ2ttSEf3uYw8ook8"],
  ["91.200.114.224:31245", "82gsyPHRofn7PXUrRuRqv6975TCcsN3e6xfwm5YviaU7GCLr9t"],
  ["82.64.119.4:31245", "5ZChvHMV3zrjnwF1WrWwnq4nYj2qR9LpA4CnQdzwjbA9gxJdYi"]
]
connect_timeout = 15000
retry_delay = 20000
' > massa/massa-node/config/config.toml

cd /massa/massa-node/
chmod +x massa-node
nohup ./massa-node --release >nohup.out 2>nohup.err </dev/null &

sleep 2m
cd /massa/massa-client/
chmod +x massa-client
./massa-client wallet_add_private_keys $my_wallet_privkey
sleep 10
./massa-client wallet_info
sleep 10
./massa-client node_add_staking_private_keys $my_wallet_privkey
cd /

echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
(echo ${my_root_password}; echo ${my_root_password}) | passwd root
service ssh restart

cd /
./rolls.sh

sleep infinity
