#!/bin/bash

echo 'export my_discord_id='${my_discord_id} >> $HOME/.bashrc
echo 'export my_wallet_privkey='${my_wallet_privkey} >> $HOME/.bashrc
echo 'export my_wallet_addr='${my_wallet_addr} >> $HOME/.bashrc
source $HOME/.bashrc

wget https://github.com/massalabs/massa/releases/download/TEST.9.2/massa_TEST.9.2_release_linux.tar.gz
tar -xvf massa_TEST.9.2_release_linux.tar.gz

echo '[bootstrap]
max_ping = 10000
bootstrap_list = [
    ["178.62.202.206:31245", "6BTVgJHnsfwy2f9KJpVPAzH5wDoGmYJDnJSTygwTqEuU8mU4Q9"],
    ["194.156.79.23:31245", "6uscLLig9FnKqL8vHpSJMNLPH3Ud6EAWLs4zvNduP2uwihPHLb"],
    ["135.181.94.227:31245", "5QaGb69Q2DDwnDcb7cWRrsBzjgY6XsqyGTZUMrL7fuZe5u9Rq7"],
    ["167.99.209.179:31245", "7sVgP8eoJ4pCzVEE9Hb1NHt6yqdKR3t5aujc3r2nkJSUkQtLwi"],
    ["194.233.84.224:31245", "87kJjGam2JqL84seerUpQmkxSjinzufkKyt7wFyLeqp5nxS8MA"],
    ["192.248.163.223:31245","7waqbYdu1V3VvtxtvoncymdLvQcVPYQQUMJfF6c1yiKih28DWD"],
    ["65.108.49.22:31245", "8gfAXWTyyA8dT51ukX2xtbu2jrTr9yPYK3k856yq7Hk4sm4ArC"],
    ["65.21.72.209:31245",  "7EFpAvpGCMpkF6tFU5WaYe6ZvuhCV9YLoaGE2JHnUdrueR6F4Q"],
    ["149.202.86.103:31245", "5GcSNukkKePWpNSjx9STyoEZniJAN4U4EUzdsQyqhuP3WYf6nj"],
    ["149.202.89.125:31245", "5wDwi2GYPniGLzpDfKjXJrmHV3p1rLRmm4bQ9TUWNVkpYmd4Zm"],
    ["158.69.120.215:31245", "5QbsTjSoKzYc8uBbwPCap392CoMQfZ2jviyq492LZPpijctb9c"],
    ["65.108.14.245:31245", "8KKWHVJd2LKeVBNmYVEnX2mcwm7aQ3onsaR9fyETjgCB4uiQTs"],
    ["94.156.93.150:31245", "6FK8yGC1uQiTYdq4GfK8aNdC8MbLjfLzc5SaAwJ4snxsSDJsSU"],
        ["5.188.88.251:31245", "6Pwd4zQ3MMHp8vDRdwJhBRShD9dB6DTSHbJx1sHK2yLBorV7fC"],
        ["147.182.139.198:31245", "4zDLAs5zSfnS5VkBRUpwggNzVzkKT1eRH1gFdsHuYEh2GP9PZA"],
        ["89.108.71.233:31245", "5rDHwG5hnaneMc1j3mWitzf7bXTwDThFkKeHbLJchQnaCmN5yS"],
        ["49.12.44.71:31245", "6WQsWWF4D5rATBMtnUhuRLPxRkjoZNqqV2vwScDuvyBxCcm1mf"],
        ["94.140.249.153:31245", "71NRk5K5qk77LsgZcQ69PGQaWwT8AH8xwSitz2usZBvwDmVo8S"],
        ["109.205.181.58:31245", "7F5WDunitHr7Qcvj1QAiqg9WeNvpwe8X4475TgPhqd59jy1Zak"],
        ["45.150.67.107:31245", "8dq8YNHqUaSLZPasVWQj6QjSotrsDrygxYvphWE1FnKtVi8vDB"],
        ["94.124.78.102:31245", "88gDnfVSyevm4byHHK5Ec2XZqsgomzt412Pscr7Ea1TmY8oQT7"],
        ["194.163.171.44:31245", "8btkw4aVuj3HYVeg1AwPpD1wYFRPVp3Y5aEdcfEESFTjfhEVLB"],
        ["62.141.44.130:31245", "7FFSm1whXfTr46qVy3oTr1u1VPhCGVNa2yzJ7zwD16mqgoe2aR"],
        ["150.158.145.4:31245", "89Z44JNLYZhsYS3GRThVmeFheJjrjqTkcWeDswWVQ97XTU7ipm"],
	["150.158.147.162:31245", "7ze1dt5vvMNafbPKMxdzT75ikDJNmM2BQe7j787Zg4UjYws6zb"],
	["95.216.2.219:31245", "6upC7o9iepMNstb7snuL2ZSeHqqoBTMSyxST1s9ZJM3KkmPxeQ"],
	["47.88.100.112:31245", "8gp9L6ZioFtkwvzHTnxUATrGgY3pk8EExUHrX7BU6Qu4n6D7QW"],
	["173.249.55.103:31245", "6bHaZUeLcWs4F8JiJdtmE8ZNeTys4VJFsp76DU6a4CYVvVJp1c"],
	["65.108.49.230:31245", "5uUgcsUd6nmTL88k8YYhFmjBKMeMh5qMRZ7gbuVyXAmuWsuVTf"],
	["144.91.88.109:31245", "66bw3ydYbAJkgdecj6XxGpRDQpLKTPJxP9Yf4tw1NQhT1k1egb"],
	["164.68.125.90:31245", "5khr4BtqomvZaRwFuKYaHGqHVwS618mfynLHvwxN7xmp6jM86N"],
	["149.202.86.103:31245", "5GcSNukkKePWpNSjx9STyoEZniJAN4U4EUzdsQyqhuP3WYf6nj"],
	["149.202.89.125:31245", "5wDwi2GYPniGLzpDfKjXJrmHV3p1rLRmm4bQ9TUWNVkpYmd4Zm"],
	["158.69.120.215:31245", "5QbsTjSoKzYc8uBbwPCap392CoMQfZ2jviyq492LZPpijctb9c"],
	["138.197.174.5:31245", "7dEN3dMQzEBSRA2gXU79rZZbGzf7AZK9m8kKQAajS1oVrL8DrW"],
	["85.14.222.244:31245", "8jcRiFoKN8MfxUW7hJ8Bz1A3nzrW4saEhjcgUNoG2gJAmhd3xg"],
	["178.62.202.206:31245", "6BTVgJHnsfwy2f9KJpVPAzH5wDoGmYJDnJSTygwTqEuU8mU4Q9"],
	["135.181.94.227:31245", "5QaGb69Q2DDwnDcb7cWRrsBzjgY6XsqyGTZUMrL7fuZe5u9Rq7"],
	["167.99.209.179:31245", "7sVgP8eoJ4pCzVEE9Hb1NHt6yqdKR3t5aujc3r2nkJSUkQtLwi"],
	["194.233.84.224:31245", "87kJjGam2JqL84seerUpQmkxSjinzufkKyt7wFyLeqp5nxS8MA"],
	["192.248.163.223:31245","7waqbYdu1V3VvtxtvoncymdLvQcVPYQQUMJfF6c1yiKih28DWD"],
	["65.108.49.22:31245",   "8gfAXWTyyA8dT51ukX2xtbu2jrTr9yPYK3k856yq7Hk4sm4ArC"],
	["85.14.222.244:31245", "8jcRiFoKN8MfxUW7hJ8Bz1A3nzrW4saEhjcgUNoG2gJAmhd3xg"],
	["194.163.177.63:31245", "7BSDkwagQBvJZgj2R2voekTXbxuwEHAJp8F8bfr7LLeXAmxvXC"],
	["212.42.113.199:31245", "4tb3j98knoAHVfSGHRyoHxk4xvjQYWYBypBzyBrJXCr9VbrdWj"],
	["5.161.49.222:31245", "6ygMGHTSkGBU4XY8dMVuPk9BB7fP5sNPzoKEH6iq7s68RtP9cs"],
	["209.145.50.104:31245", "83uGitaNoksfuE6kN2B7EStyEaoMuqiqo3D7kGh4wKpyUj3eYB"],
	["5.161.58.198:31245", "5iaNyn2aZoyCVSCXBKHoPY2Sz51KBa3E3BFaFBnwyA6Jwuq6bS"],
	["159.65.90.15:31245", "5URFzRwsYv5Yf3hJSzV5QS73BqbyEfaM8bbjv2EQQUNpL8xKpE"],
	["109.107.190.20:31245", "8BNyT2fH2DAZdxdqw1LruiSVMwTDFEFzztQij9c3geEmYe5vcg"],
	["134.122.107.125:31245", "6aT2UeSFhJeM3j4uqtqaZbH5t8beZ5AgHrtjWGFU1WeMiSpA32"],
	["104.129.128.122:31245", "5EBePa834f8P3Ei6Vx7JFPzaq6JpsL4fDBRwePWfkiWM45yh6n"],
	["62.113.114.61:31245", "5H1XnnzW7FzyqgDQtCMPUbCMou5rhm9zVwjdJ7u3gUXYoJeuWi"],
	["38.242.221.166:31245", "5ParCA12BLtJcC4oMunqc5ShTn1WLMbrFTyEdpD7MtGdwqTPtg"],
	["69.174.96.162:31245", "6jNA4gj3wbtPbNyHtKWSaWCxaXTbCebwfrNDXRj5Ekh5oe1kzw"],
	["135.125.202.96:31245", "8eTVWp3KQuUJaYCso695qTjaFzDCNaDFx8DPS6VRqS6LbYKM5t"],
	["90.73.250.21:31245", "7yWw3RfqHLT6EmmKFsQbWW2ALVyAjqbgQooKGngPHCGoXPZF5n"],
	["31.42.191.135:31245", "5k78cKSkLmMzWw8gBpV5P99GB2kPQGf1LsEZ5N8LViLfBwQERV"],
	["139.64.165.135:31245", "7EeTCNm26ZoaYKFohEMjyPZHDg3S71iWhxMtGdjZqcq6fhWw2b"],
	["93.100.230.18:31245", "8A113Rh48MQGjzaFCrWfZiuomD6z8wBPyPAccVD6evZFyhVv3e"],
	["85.145.235.56:31245", "8NUkebrRjWLw5LbJKCW9uQ5vENYrCHWBJ3yYRr2xFKnaMqCYNU"],
	["185.230.138.83:31245", "5vN45Db97HRpPkPRW8Ea7e8d5YkaQz2X1RbUWKhYSFowQR5C5f"],
	["90.188.227.243:31245", "6nfrjp2dEpWKhrYKC6sodJVCpZpmcPMq3xs43NiwHdcngZtbeU"],
	["188.68.205.211:31245", "7QpV3YjexeCDwruEXcesZ66rMoAJ1ppD3HxnMKMDr7bw9EjVGD"],
	["167.86.70.89:31245", "68FwadjuMGDwZ4VTqP7bwkbXKubTfTPgZamaAtGUxcZR1kQcnx"],
	["194.163.163.170:31245", "5oYBzSQ3aQq6mb5uXAHAMrrD7xd3xhnRpcR6ERAv5kRkd9vhN9"],
	["135.181.97.95:31245", "5Z3k7aYVU55fbBf7xqrAveTNySnDEywUUAtjWKAnWWYaKkbAai"],
]
connect_timeout = 15000
retry_delay = 60000
' > massa/massa-node/config/config.toml


cd /massa/massa-node/
chmod +x massa-node
nohup ./massa-node --release >cargo.out 2>cargo.err </dev/null &

sleep 5m

cd /massa/massa-client/
chmod +x massa-client
./massa-client wallet_add_private_keys $my_wallet_privkey
sleep 10
./massa-client wallet_info
sleep 10
./massa-client node_add_staking_private_keys $my_wallet_privkey
sleep 10
./massa-client buy_rolls $my_wallet_addr 1 0
sleep 10
./massa-client node_testnet_rewards_program_ownership_proof $my_wallet_addr $my_discord_id
sleep infinity
