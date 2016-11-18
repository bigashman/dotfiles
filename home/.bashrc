# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions

[[ -d /opt/quest/bin ]] && PATH=$PATH:/opt/quest/bin
[[ -d ~/ansible/bin ]] && source ~/ansible/hacking/env-setup -q
[[ -d ~/bin/myrepos ]] && PATH=$PATH:${HOME}/bin/myrepos
[[ -d /usr/local/go/bin ]] && PATH=$PATH:/usr/local/go/bin && export GOPATH=$HOME/gowork

PATH=${PATH}:/sbin:${HOME}/bin
export PATH

case `uname -s` in
  Linux)
    alias ls='ls --color=tty'
    ;;
  Darwin)
    export CICOLOR=1
    if [[ -x ${HOME}/bin/jq-osx-amd64 ]]
    then
      alias jq=${HOME}/bin/jq-osx-amd64
    fi
    ;;
esac

if [[ -r /usr/local/bin/docker-machine ]]
then
  alias dm='docker-machine'
fi
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias r='fc -s'
alias s=sudo
alias fym='sudo $(history -p \!\!)'

if [ -r /usr/bin/vim ]
then
  alias vi=/usr/bin/vim
  export EDITOR=vim
fi

umask 0022
set -o vi

# Let's use tab to cycle through options rather than display all of them.
bind '"\t":menu-complete'

if [[ -r ~/.docker-completion.sh ]]
then
  . ~/.docker-completion.sh
fi

TZ='Europe/London'; export TZ

if [ `whoami` == "root" ]
then
  PS1='\[\e[1;31m\]\u\[\e[0m\]@\h:\[\e[1;32m\]\W\[\e[0m\]# '
else
  # PS1='\u@\h:\[\e[1;32m\]\W\[\e[0m\]\$ '
  # Only load Liquid Prompt in interactive shells, not from a script or from scp
  [[ $- = *i* ]] && [[ -r ~/.liquidprompt/liquidprompt ]] && source ~/.liquidprompt/liquidprompt
  source "$HOME/.homesick/repos/homeshick/homeshick.sh"
  source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
  [[ -r $HOME/.proxy ]] && source "$HOME/.proxy"
  [[ -r /usr/local/bin/aws_completer ]] && complete -C '/usr/local/bin/aws_completer' aws
  [[ -r /usr/local/bin/aws_completer ]] && complete -C '/usr/local/bin/aws_completer' ash
  if [[ -r ~/.proxy.cfg ]]
  then
      source ~/.proxy.cfg
      echo "use_proxy=yes
      http_proxy=${HTTP_PROXY}
      https_proxy=${HTTPS_PROXY}" >~/.wgetrc
  fi
fi

