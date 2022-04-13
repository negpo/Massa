# Massa
___
Прежде чем начать - подпишитесь на наши новостные каналы:

[Discord Akash](https://discord.gg/3SNdg3BS), [Telegram Akash EN](https://t.me/AkashNW), [Telegram Akash RU](https://t.me/akash_ru), [TwitterAkash](https://twitter.com/akashnet_), [TwitterAkashRU](https://twitter.com/akash_ru).

Отдельная благодарность за помощь в сборке [Andy](https://twitter.com/andy31259) !
___
Нода проекта Massa для развертки на Akash Network

* Если у вас уже есть кошелек - переходите к пункту ["Запрос токенов в кране"](https://github.com/Dimokus88/Massa/edit/main/README.md#%D0%B7%D0%B0%D0%BF%D1%80%D0%BE%D1%81-%D1%82%D0%BE%D0%BA%D0%B5%D0%BD%D0%BE%D0%B2-%D0%B2-%D0%BA%D1%80%D0%B0%D0%BD%D0%B5).
* Если хотите настроить в ручном режиме, то вам [сюда](https://github.com/Dimokus88/Massa/edit/main/README.md#%D0%B5%D1%81%D0%BB%D0%B8-%D0%B2%D1%8B-%D0%BF%D0%BB%D0%B0%D0%BD%D0%B8%D1%80%D1%83%D0%B5%D1%82%D0%B5-%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C-%D0%BE%D0%B1%D1%80%D0%B0%D0%B7-massa902-%D0%BD%D0%B5%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B8%D0%BC%D0%BE-%D0%B2%D1%80%D1%83%D1%87%D0%BD%D1%83%D1%8E-%D0%BF%D1%80%D0%BE%D0%B8%D0%B7%D0%B2%D0%B5%D1%81%D1%82%D0%B8-%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8-%D0%BD%D0%B8%D0%B6%D0%B5).

# Если вы планируете использовать образ massa:9.2.2 с автоматической разверткой:

## Создание кошелька
* Идем по адресу https://test.massa.net/#wallet и генерируем кошелек нажимая Generate private key (сохраняем приватный ключ из поля Add private key). Нажимаем кнопку Add.
 
![Alt-текст](https://user-images.githubusercontent.com/23629420/163007524-299d05f6-cbdb-4305-86ba-9d6a23f189ca.png)

* Из поля Address копируем свой публичный адрес кошелька. Можете сохранить файл кошелька wallet.dat нажатием Save wallet.

![Alt-текст](https://user-images.githubusercontent.com/23629420/163008630-cd244a72-ddf4-48be-8fcd-8270b2032092.png)

## Запрос токенов в кране

Идем в  [дискорд Massa](https://discord.gg/W5X3frEE), канал #testnet-faucet  и запрашиваем в кране токены на полученны адрес. Дожидаетесь поступления токенов на счет и переходите к следующему пукнкту (баланс можно проверить в [обозревателе блокчейна](https://test.massa.net/#explorer) введя свой публичный адрес).

![Alt-текст](https://user-images.githubusercontent.com/23629420/163015694-1f320c6e-1be5-47af-88ab-203f8d97c228.png)

## Разворачиваем ноду с помощью маркетплейса Akash Network
* Заполняем [deploy.yml](https://github.com/Dimokus88/Massa/blob/main/deploy.yml) со своими данными кошелька и Discord ID (получить у MassaBot), а также незабудьте расскомментить строки (удалить символ # в начале строк).

![Alt-текст](https://user-images.githubusercontent.com/23629420/163009566-323f2526-c745-4648-9670-749e14d5387b.png)

* Создаем deployment и должидаемся предложений, выбираем провайдера и ждем начала развертывания контейнера.

![Alt-текст](https://user-images.githubusercontent.com/23629420/163015058-d2d07eff-2eb5-4cad-9e17-526ca4219f1c.png)

* Переходим в вкладку Logs. Разверка ноды занимает около ***5 минут***. Через 5 минут в окно лога начнет выводится информация о работе в massa-client. Хеш транзакции, которую надо предоставить MassaBot в Discord для регистрации в программе вознаграждений, будет выведен ***последней строкой***.

![Alt-текст](https://user-images.githubusercontent.com/23629420/163021720-7b7a7779-eb68-440a-93a0-6effa37f29d8.png)

* Так жы вы можете выгрузить лог в отдельный файл для удобства работы нажав "Download logs".


* P.S. В версии 9.2.1 сохранена возможность подключения к контейнеру по SSH с параметрами root:111111 в диагностических целях ***(не делитесь ссылками и переадресованным портом к ноде!)*** . Также остается возможность ручной настройки если что то пошло не так, инструкция ниже.

___
# Если вы планируете использовать образ massa:9.0.2, необходимо вручную произвести настройки ниже:
Подключаемся к контейнеру по ssh
пользователь root, пароль 111111 ***( не делитесь ссылками и переадресованным портом к ноде!)***.

## Установка обновлений:

```
sudo apt install pkg-config curl git build-essential libssl-dev
sudo curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustc --version
rustup toolchain install nightly
rustup default nightly
rustc --version
git clone --branch testnet https://github.com/massalabs/massa.git
```
## Запуск Ноды

```
cd /massa/massa-node
nohup cargo run --release &
```
Команда nohup отвяжет лог от окна терминала и пустит его в файл nohup.out. 
После выполнения команды нажмите сочетание клавиш ctrl+c, для возврата в bash. 
Теперь ждем 10–15 минут пока нода скомпилируется и синхронизируется с пирами. 
Выполните команду top и дождитесь пока не появится процесс massa-node.

Когда процесс появился, сделайте ctrl+c, для возврата в bash.
Потом идем в папку кошелька и запускаем кошелек

## Работа с кошельком
```
cd /massa/massa-client
cargo run --release
```
Как только кошелек будет запущен делаем:
* Если нет кошелька:
```
wallet_generate_private_key
wallet_info
```
Ответ выделяем курсором(в этот момент putty уже копирует в буфер выделенный текст! CTRL+C нажимать не надо!!!) и вставляем в ваш текстовый редактор. 
Это приватник и адрес вашего кошелька!!!

* Если есть кошелек:
```
wallet_add_private_keys приватный_ключ_кошелька
wallet_info
```
Далее, шагаем в [дискорд Massa](https://discord.gg/W5X3frEE), в канале #testnet-faucet отправляем Adress своего кошелька (не перепутайте с приватником!).
Бот отправит вам 100 токенов. Ждем зачисления на счет. 

Проверяем баланс или командой ```wallet_info``` или в эксплорере Massa найдя свой кошелек. Когда токены пришли и в статусе final balance, покупаем роллы:
```
buy_rolls ваш_адрес_кошелька 1 0
```
Команда в ответ даст хеш транзакции, теперь надо подождать около 1–1:30 часа, прежде чем что-то начнет капать на кошелек. Пока ждем, скормим ноде приватник от нашего кошелька командой:
```
node_add_staking_private_keys ваш_приватный_ключ
```
Далее регистрируемся в программ вознаграждений
```
node_testnet_rewards_program_ownership_proof ваш_адрес_кошелька ваш_id_discord_от_бота
```
Ее надо скормить в терминале Putty в наш кошелек(там где делали команду wallet_info), в ответ придёт длинный хеш, их копируем и отправляем боту в [дискорд Massa](https://discord.gg/W5X3frEE).
