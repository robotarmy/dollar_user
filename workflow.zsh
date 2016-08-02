ulimit -u unlimited
ulimit -n unlimited


# blocksworld
export BW_UNITY_APP=/Applications/Unity/Unity.app


export EDITOR='emacs'
export GOPATH=~/dev/go
export PATH=$PATH:$GOPATH/bin
function crashplan_md1 {
 ssh -L 4200:localhost:4243 md1.ram9.cc
}



alias zshedit="vim ~/.zshrc"
alias workflowedit="vim ~/.workflow.zsh"
alias zshconf="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"

alias st='\git status -s'
alias add='\git add'
alias tree='command ls -lash'
alias cat='\cat -n'
alias swbt='tmuxinator start secret-weapon-base'

function pidofport() {
  command lsof -i:$1 -t
}

function appofport() {
  command ps aux | command grep `pidofport $1`
}

function be {
  command bundle exec $*
}


function bu {
  command  bundle update $*
}

function plog {
  command git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short
}

function whatchanged {
  command git whatchanged
}

function gitst {
  command git status
}

function gits {
  command git status
}

function git {
  case $1 in
    st)
      command git status
      ;;
    status)
        command git status
        ;;
    statsu)
        command git status
        ;;
    stauts)
        command git status
        ;;
    commit)
        echo ">Git Commit" $*
        command git $*
        vbranch=`git branch | grep '*' | awk '{print $2}'`
        echo ">Attempting to merge into -> origin $vbranch"
        command git pull origin $vbranch
        if [ $? -eq 0 ] ; then
          echo ">Commiting to remote -> origin $vbranch"
          command git push origin $vbranch
        else 
          echo ">ERROR REMOTE NOT COMMITED : $?"
        fi
        ;;
    *)
        command git $*
        ;;
  esac
}

# from wikipedia unix rm page
if [ -n "$PS1" ] ; then
#  function rm  { 
#    ls -FCsd "$@"
#    echo 'Remove [ny]? ' | tr -d '\012' ; read
#    if [ "_$REPLY" = "_y" ]; then
#      /bin/rm -rf "$@"
#    else
#      echo '(cancelled)'
#    fi
#  }
fi

# Project specific
# For my eyes only

if [ -f "$HOME/.dio.zsh" ]; then
  source $HOME/.dio.zsh
fi

function start_mongo_rs {
  mongod --replSet hvf --port $1 --dbpath $2 --quiet 
}

function start_mongo {
  mongod --port $1 --dbpath $2 --rest
}

function logstew_mongo {
  start_mongo 27017 $HOME/Hack/logstew/mongo
}

function ccblank {
 ssh -AY o_o@blankslate.crowdcast.com
}

function ccblankroot {
 ssh -AY -i ~/.ssh/arun_aws_key.pem root@blankslate.crowdcast.com
}


