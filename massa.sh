#!/bin/bash
source $HOME/.bashrc
TZ=Europe/Kiev
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
apt-get update
apt-get upgrade -y
apt-get install -y sudo nano wget tar zip unzip jq goxkcdpwgen ssh build-essential git make dpkg gcc nvme-cli pkg-config libssl-dev libleveldb-dev clang bsdmainutils ncdu libleveldb-dev 
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
(echo ${my_root_password}; echo ${my_root_password}) | passwd root
service ssh restart
sleep 5
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb
sudo dpkg -i ./libssl1.1_1.1.0g-2ubuntu4_amd64.deb
sudo apt-get install -y nano runit
runsvdir -P /etc/service &
source $HOME/.bashrc
discord=1
error="Error: check if your node is running: error trying to connect: tcp connect error: Connection refused (os error 111)"
echo 'export my_root_password='${my_root_password} >> $HOME/.bashrc
echo 'export my_discord_id='${my_discord_id} >> $HOME/.bashrc
echo 'export my_wallet_privkey='${my_wallet_privkey} >> $HOME/.bashrc
echo 'export my_wallet_addr='${my_wallet_addr} >> $HOME/.bashrc
echo 'export MASSA_LINK='${MASSA_LINK} >> $HOME/.bashrc
echo 'export pass='${pass} >> $HOME/.bashrc
echo 'export client='${client} >> $HOME/.bashrc
echo 'export node='${node} >> $HOME/.bashrc
source $HOME/.bashrc
echo ==========================================================
sleep 5
wget -O ./massa.tar.gz ${MASSA_LINK}
tar -xvf massa.tar.gz

node=/massa/massa-node/massa-node
client=/massa/massa-client/massa-client

cd /massa/massa-node/
chmod +x massa-node
cd /massa/massa-client/
chmod +x massa-client



IP=$(wget -qO- eth0.me)

cat > /massa/massa-node/config/config.toml <<EOF 
[network]
routable_ip = "$IP"
[bootstrap]
max_ping = 10000
bootstrap_list = [
	["157.90.145.163:31245", "P1XfVkEGGxNSzGsaNGvh7QHaW4KcuWq9dTVYao3ExqhFeAUvvhm"],
  ["92.119.112.181:31245", "P1TnruT9BnaKh6rsH6KZMiuMsZrduJGnWtVbVjwV89WjzbtLx6D"],
  ["109.107.191.175:31245", "P19khYFMDN8CvZmrxVabfxA62TRVtCH9mfUPUBegihkpackceUF"],
  ["65.109.13.10:31245", "P1SuVTsF95yci15C3qbnbApw15d6EQDPfPwdG6rm5VXPzF2orcL"],
  ["65.108.93.120:31245", "P12fCV7CsutyaNXwCZGYhM8HFjFhGWhQyxXtDSbckNcMJTHVm3Wy"],
  ["173.249.11.79:31245", "P12qJYUdfxwPxwEqGuN7brQwVKxw3y2VzwqKNPzUmjgu6S7wo9pq"],
  ["45.67.229.170:31245", "P1tUZwNMGhLGkunrEiUPW15LpBgTKPApMZFhesrpo5b7LRp9xpu"],
  ["195.88.87.254:31245", "P12sVy5Dtw3VX6xfRhD5tfraJaBLYzLeobzez6hfrLwBUXxAfo5M"],
  ["162.55.223.216:31245", "P12YMFX5uVxUcSkJAgeGV3UwCLfgNHYEKZGu2jSBo7ri3vhhdWpN"],
  ["38.242.201.97:31245", "P1h9ABe1iGB9QqZyoE4YXeCnBwQ2otaKkHWAVseTLMqo4LmQRjg"],
  ["161.97.184.236:31245", "P1HtCQizR6PDxc2yFQHVTkA5JHQYkY4jR77g3F6XMLgSmXPNcT9"],
  ["65.108.131.49:31245", "P1yfNh6sZAL2nFModQrum6rpcGdCPvdy8eomJVAMcQUBhuDJRx5"],
  ["75.119.154.157:31245", "P1LypZMoWQPjgPThtkiRo3bMpNTRf9THBak1g3ZExSL3McscaPZ"],
  ["65.21.253.147:31245", "P12YunbjCwdJPK4HzjV9X6ZFzAB1NG19gaXj9aLVTFQ2dFQ2czAn"],
  ["209.97.191.196:31245", "P12RH6REdr9puHWzABfg96wd7q3XkHcPf7SmsVDFWiZhs5pqmksV"],
  ["194.163.138.89:31245", "P14Yhqc7QqMHu1x457SPhjuQfNFmrVciMRfsxgA7DmmHTNnDrpb"],
  ["38.242.150.10:31245", "P129gmyGcK36k9EMrnUz4wg26jV1mCpGP7aJvrEpzJnUyLS3aCX"],
  ["128.199.175.106:31245", "P12tr1Hg5vdZbhfr31B2mkXTn6rvhT3ambTRCRcUTJYF3NUR8QjC"],
  ["161.97.167.74:31245", "P1tUmsAdE41oDkNtWFqQuxnzo8MZfhMQWoZaWNwo3WiYBMqUwfG"],
  ["62.171.184.249:31245", "P12w8u5VbopMCqAcgZsRpgaMdwSmJcUp9VDVSsMSripjkgwxXCfX"],
  ["178.250.246.94:31245", "P1rXhDiuL5UUPaa9PGHXsz3j3NLSN8NwAyokCnExeukbG4CGB23"],
  ["104.238.221.174:31245", "P129AWvCC6nRR71u59uFEPMTNMhAkzt7RExMcuZJ5aqCD42NctwZ"],
  ["194.233.84.243:31245", "P12iuYZgBnik9QGCqPyxTNAARbayktRdFBxUhuqBLVMQSP9Gyra2"],
  ["198.100.148.5:31245", "P12SBigpqWDkbhHX1jmkRNkwfEH4k2ocFZjvkLtYAiwCxBDV7GDj"],
  ["65.108.90.103:31245", "P1HUB8qPtdPuN2w8f8upR7anbeqNugG6GeM9EC3xYrBqKXiv12r"],
]
connect_timeout = 15000
retry_delay = 20000
EOF

cat /massa/massa-node/config/config.toml
sleep 5

cd /
mkdir /massa/massa-node/log

cat > /massa/massa-node/run <<EOF 
#!/bin/bash
exec 2>&1
exec ./massa-node -p $pass
EOF

chmod +x /massa/massa-node/run 
LOG=/root/log

cat > /massa/massa-node/log/run <<EOF 
#!/bin/bash
mkdir $LOG
exec svlogd -tt $LOG
EOF

chmod +x /massa/massa-node/log/run
ln -s /massa/massa-node /etc/service
cd /massa/massa-client/
status=`./massa-client get_status -p $pass`

while [[ $status == $error ]]
do
echo ==== Нода не подключена, ожидайте.. =====
echo ===== Node is not connected, wait.. =====
echo $status
sleep 2m
status=`./massa-client get_status -p $pass`
done

chmod +x massa-client
./massa-client wallet_add_secret_keys $my_wallet_privkey -p $pass
sleep 10
./massa-client wallet_info -p $pass
sleep 10
for ((;;))
do	
		./massa-client node_add_staking_secret_keys $my_wallet_privkey -p $pass
		
		synh=`./massa-client get_status -p $pass | grep "Version" | awk '{ print $2 }'`  
		my_wallet_addr=`./massa-client wallet_info -p $pass | grep "Address" | awk '{ print $2 }'`
		
		if [[ $discord == 1 ]]
		then
			discord=`./massa-client node_testnet_rewards_program_ownership_proof $my_wallet_addr $my_discord_id -p $pass`
		fi
		echo =================================Send to MassaBot==========================================
		echo $discord
		echo ============================================================================================
		echo === Your Public Key $my_wallet_addr Ваш публичный адрес ===
		echo ============================================================================================
		balance=$(./massa-client wallet_info -p $pass | grep "Final balance" | awk '{ print $3 }')
		int_balance=${balance%%.*}
		date		
		
		if [[ "$int_balance" -gt "99" ]] ; then
			echo "More than 99. Баланс токенов более 99. "
			resp=$(./massa-client buy_rolls $my_wallet_addr $(($int_balance/100)) 0 -p $pass)
			echo $resp
		elif [[ "$int_balance" -lt "100" ]] ; then
			echo "Less than 100. Баланс токенов менее 100."
		fi
     
	sleep 5m       
done
