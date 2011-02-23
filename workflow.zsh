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
