# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
        for rc in ~/.bashrc.d/*; do
                if [ -f "$rc" ]; then
                        . "$rc"
                fi
        done
fi

unset rc

export PATH="/usr/local/go/bin:$PATH:/home/wslu/go/bin"

export HISTTIMEFORMAT="%F %T "
export HISTFILE="/home/wslu/.bash_history"
export HISTFILESIZE=10000
export HISTSIZE=10000

export PS1="?$? \u@\h [\$(date +%k:%M:%S)] \w> "

alias boot='bash /boot-command.bash'
boot

cat /home/wslu/crc-credentials.txt

if [ -f /usr/local/share/bash-completion/bash_completion ]; then
. /usr/local/share/bash-completion/bash_completion
fi
. <(kubebuilder completion bash)

