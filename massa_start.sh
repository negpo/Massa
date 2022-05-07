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

wget -o massa.tar.gz ${MASSA_LINK}
tar -xvf massa.tar.gz
sed -i 's/\r//' rolls.sh && chmod +x rolls.sh
echo '[bootstrap]
max_ping = 10000
bootstrap_list = [
  ["95.216.252.32:31245", "7QzEVByNjepZXoALcVvce2nR8tgozhwSw3DrbKvXbLjPk5osFC"],
  ["154.12.237.236:31245", "8NnQRr3MqgLCYDtFWNVeWonpQcy2BmiReUQvcsSw4hFLhBener"],
  ["195.161.62.197:31245", "8QVvKbWdytC9SCnakCvPMsc9AD5EYpYFeY7Z5UEBjfChzyzpYb"],
  ["185.216.75.74:31245", "5SFVa7CryrPvZMpcf576tE3fAwLHsggYdWSCBZmyqxhEHzUjM2"],
  ["188.166.69.28:31245", "6kg7A4UzW12gwSxwYHPF6frQdW9wJWiZjYE6SuTVToSqw27rKc"],
  ["64.227.68.101:31245", "6AqwnCLmFtSg53Pg6SNZrwEFkt3HCBrgevZPmWiDF3X82Mg81T"],
  ["62.141.46.11:31245", "82XXWqohxyDjDnjRS1f9VdELJnnLukK3LrkSijCWMrMbDqDRP2"],
  ["161.97.133.244:31245", "8KLUKbyXMkkmGSG57YPdDcXwmrabpfoFBKg96LS5To724iqSoo"],
  ["62.171.148.115:31245", "7Jjp6zoZiyRXVEX9sjuiA3HwqEQ2icgdu9qtKdF7wimZc3Pr1B"],
  ["138.201.156.188:31245", "674nM9FVr2tbgEFQAiM1Qqgom8Feha65CqAVvt7Azt1EF9xqrM"],
  ["87.255.10.66:31245", "71m5iXxz41T29tYoB5FRh3pPKy15t4pzNMngfV5SackFxYYKgu"],
  ["65.108.215.2:31245", "5MX1mGe8gAsZ6arzsFVrF2mGKRJL3CJcLChtBxrUApVu4fBeuY"],
  ["51.38.82.84:31245", "7DSVaJiBmixVuY6gqwFya2DXMnaXtCDbfLEQpjwnHnb9ZBZ9Kg"],
  ["176.31.117.198:31245", "7PzY3Pp36MAZDdhfnAn63Le4nLSgpThJovxmcGGgJbUapM4yFi"],
  ["95.111.233.235:31245", "6hjfECe8QBAsEjmweTjpHGcFLAd7bYv139SFFqkPRXZkfiKzaX"],
  ["95.217.74.107:31245", "5pKmAjHrVjUYYhtEy2MwjNB322c7jEoktwQpF8qV9s5RpzbSCL"],
  ["195.2.85.147:31245", "8Nx5NmZe4FNGe4DQBxcuzPbmFSW6ZE4LSzNeafY5eLtHqM7uwa"],
  ["51.38.80.154:31245", "4veyFjVbfHQJVjC5pbxEwokmF4KN6wSaXVVpckpsDhJ5P9wA3H"],
  ["51.38.70.65:31245", "5W6kqx9MZbb4kSXpb5fdz7wvhw1JfHwVsxJ3TQHRH4ATA344bb"],
  ["45.135.92.100:31245", "5Bki63ZCefZ5CLJDZJrmhtEJJVAyb3Qmzzdprvb1wMfCKBbUGD"],
  ["116.203.78.176:31245", "6PmJpPZNxkU7rYoCnus5yUu1MEc3j7hkXHynAQV5zid6AjKkso"],
  ["109.107.188.253:31245", "5rVh6GJsL6A5QR99Y9W2RHaK6vGoT7P9xhRneAUaua43bqYmCk"],
  ["65.108.43.58:31245", "7RUKeV9S8nTCnmhT7hGptsD54123QZZ4FLC3XjiaSSPWMCJP9V"],
  ["51.81.82.122:31245", "7BEmGAgeMF87wuPHafS5pszqhB5DoAyBQURDKKaBUzVqaMhD1t"],
  ["161.97.140.179:31245", "8XxytrrmVXb44HhbwijV5E6WqPDQJTdubeLog6C9JjjooaU9hg"],
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
