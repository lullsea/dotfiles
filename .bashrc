# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=/usr/lib/jvm/jdk-21.0.2+13/bin:$PATH

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias ls='ls -la --color'
alias l='ls -la --color'
alias vi='vim'
alias 'wifion'='nmcli radio wifi on'
alias 'wifilist'='nmcli device wifi list'
alias 'wificonnect'='nmcli device wifi connect'
alias 'incvol'='pactl set-sink-volume @DEFAULT_SINK@ +5%'
alias 'decvol'='pactl set-sink-volume @DEFAULT_SINK@ -5%'
alias 'cat'='ccat'

alias 'bton'='systemctl bluetooth on'
