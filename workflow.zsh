GIT=/usr/local/bin/git

function git {
  case $1 in
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

if [ -n "$PS1" ] ; then
rm () 
{ 
  ls -FCsd "$@"
  echo 'remove[ny]? ' | tr -d '\012' ; read
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

function start_mongo_rs() {
  mongod --replSet hvf --port $1 --dbpath ./$2 --quiet &
}

function start_mongo() {
  mongod --port $1 --dbpath ./$2 --quiet &
}

function bu {
  bundle update $*
}

function be {
  bundle exec $*
}

function gits {
  git status
}

function ccblank {
 ssh -AY o_o@ec2-50-18-18-192.us-west-1.compute.amazonaws.com
}

function ccblankroot {
 ssh -AY -i ~/.ssh/arun_aws_key.pem root@ec2-50-18-18-192.us-west-1.compute.amazonaws.com
}

