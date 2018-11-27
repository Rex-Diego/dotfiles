###############################################################################
#alias
###############################################################################
alias vi="vim"
alias ll="ls -l -G"
alias mupdf="/Applications/mupdf.app/Contents/MacOS/mupdf-gl -C 0xfdf6e3 "
#ssh IAP
alias sstar="ssh -F $HOME/.ssh_config -Y zy@172.16.0.72 "
alias sth="ssh -F $HOME/.ssh_config -Y rex@172.19.253.125 "
alias slawr="ssh -F $HOME/.ssh_config -Y rex@172.19.249.33 "
alias slawz="ssh -F $HOME/.ssh_config -Y zy@172.19.249.33 "
alias scloud="ssh -F $HOME/.ssh_config -Y dam@172.16.0.249 "
alias sdamstar="ssh -F $HOME/.ssh_config -t -o ProxyCommand='ssh -F $HOME/.ssh_config -Y dam@2682417459 -W 172.16.0.72:22' -Y zy@2886729800"
alias sdamcloud="ssh -F $HOME/.ssh_config -t -o ProxyCommand='ssh -F $HOME/.ssh_config -Y dam@2682417459 -W 172.16.0.249:22' -Y dam@172.16.0.249"

#alias ss="ssh -qvnNCD 9080  zy@172.16.0.72"
alias sur="export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152;export all_proxy=socks5://127.0.0.1:6153"
alias sss="ssh -t -o ProxyCommand='ssh -X dam@159.226.113.51 -W 172.16.0.72:22'  -qvnND 9020 zy@172.16.0.72"
alias ssss="ssh -qvnNCD 9010  dam@159.226.113.51"
alias dfstar='rsync -avPH -e "ssh -F $HOME/.ssh_config " zy@zy_loop:/data3/users/zy/receive/updown/ .'
alias rm='rmtrash'
###############################################################################
#PATH
###############################################################################
export PATH=~/soft/bin:$PATH
export PATH=/Library/TeX/texbin:$PATH
export PATH="/usr/local/sbin:$PATH"

################################################################################
#Basic Environment Variable
###############################################################################
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export PS1="[\[\e[32m\]#\##\[\e[31m\]\u@\[\e[36m\]\h \w]\$\[\e[m\] "
export ARCHFLAGS='-Wno-error=unused-command-line-argument-hard-error-in-future'

###############################################################################
#Soft
###############################################################################
#export PATH="/usr/local/opt/openssl/bin:$PATH"
