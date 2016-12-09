function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

source ~/.aliases

ORANGE="\[\033[1;31m\]"
BLUE="\[\033[0;36m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
BLACK="\[\033[0;0m\]"
YELLOW="\[\033[0;33m\]"
LIGHT_YELLOW="\[\033[1;33m\]"
RESTORE="\[\033[m\]"
BLINK_RED="\[\033[5;31m\]"
export PS1="$LIGHT_YELLOW\w $GREEN\$(parse_git_branch)\n$BLUE\u $RED-> $RESTORE"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
# alias ls='ls -GFh'

source ~/.git/completion.bash

export HISTSIZE=10000

export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"
export BUNDLE_PATH="vendor/bundle"

export RUBY_GC_HEAP_INIT_SLOTS=800000
export RUBY_GC_HEAP_FREE_SLOTS=32768
export RUBY_GC_MALLOC_LIMIT=50000000
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export BUNDLE_PATH='vendor/bundle'

export CATALINA_HOME="$HOME/Tools/apache-tomcat-7.0.70"
export CPPUTEST_HOME="$HOME/Tools/cpputest"

export HTQ_MAVEN_REPO_USERNAME='alex'
export HTQ_MAVEN_REPO_PASSWORD='put_the_actual_password_here'


export PATH="$HOME/.jenv/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
export PATH="/usr/local/sbin:$PATH"

# VirtualEnvWrapper location
export WORKON_HOME=/Users/alexc/.virtualenvs

source /usr/local/bin/virtualenvwrapper.sh
export PYTHONSTARTUP=~/.pythonrc
