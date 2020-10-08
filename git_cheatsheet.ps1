#vanilla git
#make local copy of remote branch
git checkout -b {localBranchName} {remoteBranchName}

#delete local and remote branch
git branch -D {branch_name}
git push --delete {usually_origin} {branch_name}

#git rename local branch
git branch -m {new_branch_name}

#tags
git push origin --tags

#git flow
#init git flow with it's default options
git flow init -d

#default settings are (some newer git versions do not provision these automatically)
[gitflow "branch"]
    master = master
    develop = develop
[gitflow "prefix"]
    feature = feature/
    bugfix = bugfix/
    release = release/
    hotfix = hotfix/
    support = support/
    versiontag = ""

#see gitflows current configs - can be manually seen in .git/config file - all configs for the current repo are keys there
git flow config

#start/finish a new git flow branch
git flow [start] [feature|bugfix|hotfix|release|support] {branchName}
git flow [finish] [feature|bugfix|support] {branchName} --squash
git flow [finish] [hotfix|release] {branchName} --squash --tagname {{tagName}}