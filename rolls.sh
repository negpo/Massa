#!/bin/bash
cd /massa/massa-client
while true
do
        tail /massa/massa-node/nohup.out
		
	./massa-client node_testnet_rewards_program_ownership_proof $my_wallet_addr $my_discord_id
	balance=$(./massa-client wallet_info | grep "Final balance" | awk '{ print $3 }')
        int_balance=${balance%%.*}
	if [[ "$int_balance" -gt "99" ]] ; then
                echo "More than 99. Баланс токенов более 99. "
                resp=$(./massa-client buy_rolls $my_wallet_addr $(($int_balance/100)) 0)
                echo $resp
        elif [[ "$int_balance" -lt "100" ]] ; then
                echo "Less than 100. Баланс токенов менее 100."
        fi
        printf "sleep"
        for((sec=0; sec<$wait; sec++))
        do
                printf "."
                sleep 1
        done
        printf "\n"
done
