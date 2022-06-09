#!/bin/bash
echo ================================================================================
echo ================================================================================
echo ===========██████╗░██╗███╗░░░███╗░█████╗░██╗░░██╗██╗░░░██╗░██████╗==============
echo ===========██╔══██╗██║████╗░████║██╔══██╗██║░██╔╝██║░░░██║██╔════╝==============
echo ===========██║░░██║██║██╔████╔██║██║░░██║█████═╝░██║░░░██║╚█████╗░==============
echo ===========██║░░██║██║██║╚██╔╝██║██║░░██║██╔═██╗░██║░░░██║░╚═══██╗==============
echo ===========██████╔╝██║██║░╚═╝░██║╚█████╔╝██║░╚██╗╚██████╔╝██████╔╝==============
echo ===========╚═════╝░╚═╝╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚═╝░╚═════╝░╚═════╝░==============
echo ================================================================================
echo ============================= https://t.me/Dimokus =============================
echo ================================================================================
sleep 5
echo ================================================================================
echo ================================================================================
echo ██████╗░░█████╗░░██╗░░░░░░░██╗███████╗██████╗░███████╗██████╗░  ██████╗░██╗░░░██╗
echo ██╔══██╗██╔══██╗░██║░░██╗░░██║██╔════╝██╔══██╗██╔════╝██╔══██╗  ██╔══██╗╚██╗░██╔╝
echo ██████╔╝██║░░██║░╚██╗████╗██╔╝█████╗░░██████╔╝█████╗░░██║░░██║  ██████╦╝░╚████╔╝░
echo ██╔═══╝░██║░░██║░░████╔═████║░██╔══╝░░██╔══██╗██╔══╝░░██║░░██║  ██╔══██╗░░╚██╔╝░░
echo ██║░░░░░╚█████╔╝░░╚██╔╝░╚██╔╝░███████╗██║░░██║███████╗██████╔╝  ██████╦╝░░░██║░░░
echo ╚═╝░░░░░░╚════╝░░░░╚═╝░░░╚═╝░░╚══════╝╚═╝░░╚═╝╚══════╝╚═════╝░  ╚═════╝░░░░╚═╝░░░
sleep 1
echo ====================░█████╗░██╗░░██╗░█████╗░░██████╗██╗░░██╗=====================
echo ====================██╔══██╗██║░██╔╝██╔══██╗██╔════╝██║░░██║=====================
echo ====================███████║█████═╝░███████║╚█████╗░███████║=====================
echo ====================██╔══██║██╔═██╗░██╔══██║░╚═══██╗██╔══██║=====================
echo ====================██║░░██║██║░╚██╗██║░░██║██████╔╝██║░░██║=====================
echo ====================╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝=====================
sleep 10

apt-get update
apt-get install ssh -y

echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
(echo ${my_root_password}; echo ${my_root_password}) | passwd root
service ssh restart
discord=1
echo 'export my_root_password='${my_root_password} >> $HOME/.bashrc
echo 'export my_discord_id='${my_discord_id} >> $HOME/.bashrc
echo 'export my_wallet_privkey='${my_wallet_privkey} >> $HOME/.bashrc
echo 'export my_wallet_addr='${my_wallet_addr} >> $HOME/.bashrc
echo 'export MASSA_LINK='${MASSA_LINK} >> $HOME/.bashrc
source $HOME/.bashrc

wget -O ./massa.tar.gz ${MASSA_LINK}
tar -xvf massa.tar.gz

cd /massa/massa-node/
chmod +x massa-node
nohup ./massa-node --release > /dev/null 2>&1 & nodepid=`echo $!`
echo $nodepid
sleep 2m
cd /massa/massa-client/
chmod +x massa-client
./massa-client wallet_add_private_keys $my_wallet_privkey
sleep 10
./massa-client wallet_info
sleep 10
cd /

cd /massa/massa-client

for ((;;))
do
		
		if [[ -z `ps -o pid= -p $nodepid` ]]
		then
			echo ===================================================================
			echo ===Нода не работает, перезапускаю...Node not working, restart...===
			echo ===================================================================
			cd /massa/massa-node/
			nohup  ./massa-node --release   > /dev/null 2>&1 & nodepid=`echo $!`
			echo $nodepid
			sleep 1
			source $HOME/.bashrc
			cd /
		else
			echo =================================
			echo ===Нода работает.Node working.===
			echo =================================
			echo $nodepid
			sleep 1
			source $HOME/.bashrc
		fi
		
		./massa-client node_add_staking_private_keys $my_wallet_privkey
		
		synh=`./massa-client get_status | grep "Version" | awk '{ print $2 }'`  
		my_wallet_addr=`./massa-client wallet_info | grep "Address" | awk '{ print $2 }'`
		
		if [[ $discord == 1 ]]
		then
			discord=`./massa-client node_testnet_rewards_program_ownership_proof $my_wallet_addr $my_discord_id`
		fi
		echo =================================Send to MassaBot==========================================
		echo $discord
		echo ============================================================================================
		echo === Your Public Key $my_wallet_addr Ваш публичный адрес ===
		echo ============================================================================================
		balance=$(./massa-client wallet_info | grep "Final balance" | awk '{ print $3 }')
		int_balance=${balance%%.*}
		date		
		
		if [[ "$int_balance" -gt "99" ]] ; then
			echo "More than 99. Баланс токенов более 99. "
			resp=$(./massa-client buy_rolls $my_wallet_addr $(($int_balance/100)) 0)
			echo $resp
		elif [[ "$int_balance" -lt "100" ]] ; then
			echo "Less than 100. Баланс токенов менее 100."
		fi
     
	sleep 5m       
done

	

