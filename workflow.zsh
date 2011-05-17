GIT=/usr/local/bin/git

function crashplan_md1 {
 ssh -L 4200:localhost:4243 md1.ram9.cc
}
alias cat='cat -n'
function git {
  case $1 in
    statsu)
        $GIT status
        ;;
    stauts)
        $GIT status
        ;;
    commit)
        echo ">Git Commit" $*
        $GIT $*
        vbranch=`git branch | grep '*' | awk '{print $2}'`
        echo ">Commiting to remote" $vbranch
        $GIT fetch origin $vbranch
        $GIT push origin $vbranch
        ;;
    *)
        $GIT $*
        ;;
  esac
}

# from wikipedia unix rm page
if [ -n "$PS1" ] ; then
  function rm  { 
    ls -FCsd "$@"
    echo 'Remove [ny]? ' | tr -d '\012' ; read
    if [ "_$REPLY" = "_y" ]; then
      /bin/rm -rf "$@"
    else
      echo '(cancelled)'
    fi
  }
fi

# Sensitive Material Crowdcast
# For my eyes only
if [ -f "$HOME/crowdcast.zsh" ];then
  source $HOME/crowdcast.zsh
fi
function crsconsole {
heroku console --app captainrecruiter-staging   

}
function crslogtail {
heroku logs --tail --app captainrecruiter-staging   
}

function start_mongo_rs {
  mongod --replSet hvf --port $1 --dbpath $2 --quiet 
}

function start_mongo {
  mongod --port $1 --dbpath $2 --rest
}

function logstew_mongo {
  start_mongo 27017 $HOME/Hack/logstew/mongo
}

function bu {
  bundle update $*
}

function be {
  bundle exec $*
}

function hammer_time {
  git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short
}

function gitwh {
  git whatchanged
}

function gitst {
  git status
}

function gits {
  git status
}

function ccblank {
 ssh -AY o_o@blankslate.crowdcast.com
}

function ccblankroot {
 ssh -AY -i ~/.ssh/arun_aws_key.pem root@blankslate.crowdcast.com
}

