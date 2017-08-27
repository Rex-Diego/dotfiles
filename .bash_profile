###############################################################################
#alias
###############################################################################
alias vi="vim"
alias ll="ls -l -G"
alias mupdf="/Applications/mupdf.app/Contents/MacOS/mupdf-gl -C 0xfdf6e3 "
#ssh IAP
alias sshstar="ssh -F $HOME/.ssh_config -Y zy@172.16.0.72 "
alias sshcloud="ssh -F $HOME/.ssh_config -Y dam@172.16.0.233 "
alias sshdam="ssh -F $HOME/.ssh_config -Y dam@2682417459 "
alias sshdamstar="ssh -F $HOME/.ssh_config -t -o ProxyCommand='ssh -F $HOME/.ssh_config -Y dam@2682417459 -W 172.16.0.72:22' -Y zy@2886729800"
alias sshdambcm="ssh -F $HOME/.ssh_config -t -o ProxyCommand='ssh -F $HOME/.ssh_config -Y dam@2682417459 -W 172.16.0.101:22' -Y zy@172.16.0.101"
alias sshdamcloud="ssh -F $HOME/.ssh_config -t -o ProxyCommand='ssh -F $HOME/.ssh_config -Y dam@2682417459 -W 172.16.0.233:22' -Y dam@172.16.0.233"
alias sss="ssh -t -o ProxyCommand='ssh -X dam@159.226.113.51 -W 172.16.0.72:22'  -qvnnND 9070 zy@172.16.0.72"
alias dfstar='rsync -avPH -e "ssh -F $HOME/.ssh_config " zy@zy_loop:/data3/users/zy/receive/updown/ .'
#alias screen="bash $HOME/.grabssh; screen -c $HOME/.screenrc_hubery "
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
eval $(thefuck --alias)
# added by Anaconda2 4.2.0 installer
export PATH="/Users/zhaoyu/soft/anaconda2/bin:$PATH"

# pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

# packman
source /Users/zhaoyu/soft/packman/bashrc
export NCARG_ROOT="/Users/zhaoyu/.packman/packman.active"
