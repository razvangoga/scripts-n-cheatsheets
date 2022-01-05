#vanilla git
#make local copy of remote branch
git checkout -b {localBranchName} {remoteBranchName}

#delete local and remote branch
git branch -D {branch_name}
git push --delete {usually_origin} {branch_name}

#git rename local branch
git branch -m {new_branch_name}

#git untrack files / folders
git rm --cached {{file_name}}
git rm -r --cached {{folder_name}}

#git configs
#user custom ssk key
git config --global core.sshCommand 'ssh -i C:/Users/some-user/.ssh/key_rsa'


#tags
git push origin --tags

#github fork update
git remote add upstream {{github_original_repo_url}}
git fetch upstream
git merge upstream/{{branch_name}}
git push

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