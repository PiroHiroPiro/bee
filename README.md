
# Beetle
Slackに任意のコマンドの終了を通知する．
また最新のログファイルも送信する．
機械学習等の実行に時間のかかるプログラムを実行するときに利用する予定で作成した.

### Setup
1. Slack BOT Tokenの取得およびSlack Channel IDを調べる．
- [Slack App Directory](https://beetle.slack.com/apps)
- [Slack — APIに使う「チャンネルID」を取得する方法](https://qiita.com/YumaInaura/items/0c4f4adb33eb21032c08)

```
$ git clone https://github.com/PiroHiroPiro/bee.git
$ cd bee
$ cp .env.example .env
$ vim .env
$ chmod +x bee.sh
$ echo "alias bee=\"`pwd`/bee.sh\"" >> ~/.bashrc
$ . ~/.bashrc
```

### How to use
```
$ bee $COMMAND
```
COMMANDは任意のコマンド

e.g.,
```
$ bee python train.py --epoch 50
```
