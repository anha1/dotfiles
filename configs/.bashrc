#
# ~/.bashrc
#

[[ $- != *i* ]] && return

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'; }
BRANCH='\[\e[36m\]$(git_branch)\[\e[0m\]'
WARN='\[\e[1;41;37m\]$(if [ $? -ne 0 ]; then echo "[!!!-$?]";fi)\[\e[0m\]'
DIR='\[\e[35m\]$(pwd | sed "s/\([^\/]\)[^\/]*\//\1\//g")\[\e[0m\]'
HOST='\[\e[32m\]\u\[\e[0m\]\[\e[35m\]@\[\e[0m\]\[\e[33m\]\h\[\e[0m\]\[\e[31m\]:\[\e[0m\]'

export PS1="$WARN$HOST$BRANCH$DIR$ "

export PATH=$JAVA_HOME/bin:$M2_HOME/bin:$HADOOP_HOME/bin/:$GRADLE_HOME/bin/:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

fprint () {
    toilet $1 -f future.tlf --filter crop -w 90 | lolcat
}

export -f fprint

alias mci="mvn clean install"
alias mcist="mvn clean install -DskipTests=true -Dcheckstyle.skip=true"
alias mcit="mvn clean install -DskipTests=false"
alias syu="sudo pacman -Syyu"
alias aur="yaourt -Syyu --aur --noconfirm"
alias lo="i3lock -c 000000"
( uname -sr |sed "s/-MANJARO//" | toilet $1 -f pagga.tlf --filter crop -w 90 ; echo -n ' ' ; date  ; uptime ) | lolcat -p 9 -S 0
