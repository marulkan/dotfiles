#!/bin/bash

dunst &
qutebrowser --backend webengine --qt-name main-window &
#termite --name=term-im -e 'weechat' &
#termite --name=term-khal -e ~/bin/loop_khal.sh &
#termite --name=term-todo -e ~/bin/loop_jira.sh &
#termite --name=term-irc -e 'ssh marulkan.com -l marulkan' &
termite -e offlineimap &

#cd ~/devel/github/lemon-collector
#python main.py | lemonbar -d -g 1920x16 -p -f "EnvyCodeR-10" -f "FontAwesome-12" &

setxkbmap se
xmodmap ~/.Xmodmap
