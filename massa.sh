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
wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1l-1ubuntu1.6_amd64.deb
sudo dpkg -i libssl1.1_1.1.1l-1ubuntu1.6_amd64.deb
sudo apt-get install -y nano runit
runsvdir -P /etc/service &
source $HOME/.bashrc
discord=1
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
EOF

cat /massa/massa-node/config/config.toml
sleep 5

cd /
mkdir /root/massa-node
mkdir /root/massa-node/log


cat > /root/massa-node/run <<EOF 
#!/bin/bash
exec 2>&1
exec $node -p $pass
EOF

chmod +x /root/massa-node/run
LOG=/root/log

cat > /root/massa-node/log/run <<EOF 
#!/bin/bash
mkdir $LOG
exec svlogd -tt $LOG
EOF

chmod +x /root/massa-node/log/run
ln -s /root/massa-node /etc/service


sleep 2m
cd /massa/massa-client/
chmod +x massa-client
$client wallet_add_private_keys $my_wallet_privkey -p $pass
sleep 10
$client wallet_info -p $pass
sleep 10
for ((;;))
do	
		$client node_add_staking_private_keys $my_wallet_privkey -p $pass
		
		synh=`$client get_status -p $pass | grep "Version" | awk '{ print $2 }'`  
		my_wallet_addr=`$client wallet_info -p $pass | grep "Address" | awk '{ print $2 }'`
		
		if [[ $discord == 1 ]]
		then
			discord=`$client node_testnet_rewards_program_ownership_proof $my_wallet_addr $my_discord_id -p $pass`
		fi
		echo =================================Send to MassaBot==========================================
		echo $discord
		echo ============================================================================================
		echo === Your Public Key $my_wallet_addr Ваш публичный адрес ===
		echo ============================================================================================
		balance=$($client wallet_info -p $pass | grep "Final balance" | awk '{ print $3 }')
		int_balance=${balance%%.*}
		date		
		
		if [[ "$int_balance" -gt "99" ]] ; then
			echo "More than 99. Баланс токенов более 99. "
			resp=$($client buy_rolls $my_wallet_addr $(($int_balance/100)) 0 -p $pass)
			echo $resp
		elif [[ "$int_balance" -lt "100" ]] ; then
			echo "Less than 100. Баланс токенов менее 100."
		fi
     
	sleep 5m       
done
