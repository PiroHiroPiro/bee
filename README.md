# Beetle

This is a bot that sends command results and log file.

# Usage

Enter the command to be executed after `bee`.

```console
$ bee COMMAND
```

e.g.,
```console
$ bee python train.py --epoch 50
```

# Install

Get Slack BOT Token and Slack Channel ID:

refs(Japanese only):
- [Slack App Directory](https://beetle.slack.com/apps)
- [Slack — APIに使う「チャンネルID」を取得する方法](https://qiita.com/YumaInaura/items/0c4f4adb33eb21032c08)

Clone repository:

```console
$ git clone https://github.com/PiroHiroPiro/beetle.git
$ cd beetle
```

Copy env file:

```console
$ cp .env.example .env
$ vim .env
```

Setup shell script:

```console
$ chmod +x bee.sh
$ echo "alias bee=\"`pwd`/bee.sh\"" >> ~/.bashrc
$ . ~/.bashrc
```

## Licence

This software is released under the MIT License, see [LICENSE](https://github.com/PiroHiroPiro/beetle/blob/master/LICENSE).

## Author

[Hiroyuki Nishizawa](https://github.com/PiroHiroPiro)
