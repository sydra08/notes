Version Control System (VCS)
  - storying multiple versions of a single project \
  and being able to call each version at another point in time
  - ie. saving different timestamped versions of a file in one folder
  - allows you to easily rollback to a prev version of your code
  - facilitates collaboration
  - allows you to make mistakes!

  local vs remote
  - local => stores all the info on your comp (good for individual work)
  - repository = where project data is stored (giant folder of files for one project)
    - usually kept on a company server so reqs network access
  - distributed version control system
    - all users have complete copy of the whole repo
    - doesn't req network connection, you can push/merge after you reconnect
    - ie. Git
      - started in 2005; very popular version control system in the industry

Starting a New Project
1) make a new directory on your comp
  mkdir project-name (create new dir)
  cd project-name (move into the new dir)
  ls (see all files and folders in the dir)
2) transform into a Git-enabled directory (git will tell you if successful)
  git init (initializes a new Git repo in your current dir)
3) create files in the directory
  touch filename.ext
4) find out what git thinks the current repo looks like (check the repo status)
  git status
5) tell Git to keep track of a file
  git add <filename or path>
  git add . (capture all dir changes/stage entire directory and all non-empty directories in current dir)
  ie. git add README.md
6) create changes to our repo via commits
  - Commit = like a frozen copy of your code at a given point in time
  - you must always add a message that describes your commit
  - make sure to write the message in present tense???
  - after you make a commit your git status will be nothing bc there's nothing to commit
  git commit -m "message about commit" (only what's staged to commit)
  git commit -am "message" (-a flag means all changes)

FORKING
- how you make your own copy of a GitHub repo
- GitHub creates a copy of the repo so that you can use it as your sandbox
- the original repo stays intact
- to access your fork of a Learn.co lab: https://github.com/your-username-here/first-lab-001-prework-web

CLONING
- get the forked copy of the repo on your local
- nav to forked repo on GitHub
- set SSH as URL type
- copy to clipboard
- in terminal: git clone URL

GitHub
- it's a cloud git repository

Setup Remote Repo on GitHub
1) GitHub Profile
2) "Create New Repository" button
3) "Quick Setup" section
4) "copy to clipboard" (next to repo URL)

Connect Remote Repo to Local Repo
1) git init
2) git add .
3) git commit -m "initialize git"
4) git remote add origin your-remote-repo-URL
  - sets the remote so that you can push and pull code

ORIGIN
- default alias assigned to the new remote repo
- you can change the name
  - git remote rename origin new-name

git remote -v
- view existing remotes and names

git branch -r
- get all the branch names

GIT PUSH
- send code from local repo to associated remote repo
- (explicit) git push remote-repo-name remote-branch-to-send-code-to
  - ie. git push origin master
  - note: "origin" is the alias so you can use that instead of the actual name
- (implicit) git push
  - pushes your code to the remote repo/branch that you're tracking
- the first time you push code to the repo you'll want to use the -u flag
  - git push -u origin master
  - the -u flag = --set-upstream
    - tells the current local branch to track itself agains the master branch of origin


GIT PULL
- get the new code from the remote repo to our local
- (implicit) git pull
- (explicit) git pull remote-repo-name remote-branch-to-get-code-from
- use if you want to fetch and merge (which is 99% of the time)
  - it git fetch the remote changes on all branches
  - automatically merges any changes on a remote branch that you're tracking via local one


PULL REQUESTS
- only exists in GitHub
- request for the owner of a repo to pull from my local
  - not nice to push code onto others
- if accepted, your code will be merged into the original repo
- really useful in open source and big collab projects
- how?
  1) nav to repo
  2) click on pull requests (top right corner)
  3) click "new pull request"
  4) choose base fork ie. their-user-name/awesome-lab
  5) choose head fork ie. your-user-name/awesome-lab
  6) click "create pull request"
- code changes that are committed + pushed before pull request is accepted are added automatically

COLLABORATION
- key objective is to keep discrete and individual lines of work isolated from each other

GIT BRANCH
- timeline branch
  - when there's a linear sequence of events
  - ie. not multiple commits by multiple people around the same time
- by default, when you start a repo your main branch is master
  - git status => tells you what branch you're on
  - good practice to make sure the master branch is always clean with working code
    - do not add broken code in master
- new features
  - create in isolated feature branch
  - this way you can keep master branch clean
  - files created and committed in the branch will not automatically be added to master
- create new branch: git branch <branch name>
- see list of branches: git branch -a
  - here the * indicates the working branch (the branch the commit is applied to)
- to move to a different branch: git checkout <branch name>
- create and move to a new branch at the same time: git checkout -b new-branch-name
- branches are behind of master when new code is committed to master after you create the branch
- master is ahead of branch when new code is committed to it after branch is made
- merge branches (aka make the timeline linear again)
  - the commits from the branch will seem like they occurred on the master timeline
  - to start, be on the branch you want to merge into (ie. be in master branch)
  - merge: git merge <branch name> (branch is the one you want to merge into master)
- rename file: mv <original filename> <new filename>
- you will need to add + commit this file to the branch so that it gets tracked

GIT FETCH
- update your local copy with other branches that might've been added to the GitHub remote
- the message will tell you which remote the git fetch updated from
- "fetch" copies all the changes on the remote to the local git repo but doesn't merge them
- use git merge origin/master (remote/branch) to integrate the fetched code
- new branches will also be fetched
  - you can check them out and then merge if you want to
  - when you checkout a fetched remote branch, git creates a local branch that tracks that remote one
- low-level git command bc it requires 2 steps

- delete branch: git branch -d <branch name>

touch .gitignore => creates a file that holds the files you don't want to appear in git repo
(https://gist.githubusercontent.com/octocat/9257657/raw/3f9569e65df83a7b328b39a091f0ce9c6efc6429/.gitignore)
https://help.github.com/articles/ignoring-files/ => copy into repo

1) git commit -am "message"
  => stage and commit all files
2) git push -u origin your-branch
  => push the code to the feature branch (your-branch)
3) git checkout master  
  => switch to master branch
4) git merge your-branch  
  => merge feature branch w master
5) git push origin master
  => push changes
