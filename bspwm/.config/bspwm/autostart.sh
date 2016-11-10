#!/bin/bash

qutebrowser --qt-name main-window &
termite --name=term-mail -e 'mutt' &
termite --name=term-im -e 'weechat' &
termite --name=term-khal -e ~/bin/loop_khal.sh &
termite --name=term-todo -e ~/bin/loop_jira.sh &
termite --name=term-irc -e 'ssh marulkan.com -l marulkan' &

cd ~/devel/github/lemon-collector
python main.py | lemonbar -g 1920x16 -p -f "Tamsyn-12" -f "FontAwesome-12" &

setxkbmap se
xmodmap ~/.Xmodmap
