#vanilla git
#make local copy of remote branch
git branch -b {localBranchName} {remoteBranchName}

#tags
git push origin --tags

#git flow
#init git flow with it's default options
git flow init -d
#see gitflows current confgigs - can be manuall seen in .git/config file - all configs for the current repo are keys there
git flow config

#start/finish a new git flow branch
git flow [start|finish] [feature|bugfix|hotfix|release|support]  {branchName}