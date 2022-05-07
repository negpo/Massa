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
