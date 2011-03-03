GIT=/usr/local/bin/git

function git {
  case $1 in
    commit)
        echo ">Git Commit" $*
        $GIT $*
        vbranch=`git branch | grep '*' | awk '{print $2}'`
        echo ">Commiting to remote" $vbranch
        $GIT push origin $vbranch
        ;;
    *)
        $GIT $*
        ;;
  esac
}

alias rm='rm -i'

# Sensitive Material Crowdcast
# For my eyes only
if [ -f "$HOME/crowdcast.zsh" ];then
  source $HOME/crowdcast.zsh
fi

