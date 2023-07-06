---
title: Git
lang: en-US
tags: ["practice"]
---

<Header />

&nbsp;
&nbsp;
- Credits:
  - [Git Bickbucket - Cheatsheet](https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet)
  - [Gitlab - Git Cheat Sheet](https://about.gitlab.com/images/press/git-cheat-sheet.pdf)



## 🎯 Practice
- [w3school practice | Git](https://www.w3schools.com/git/exercise.asp)

## Quick Tables

<br>
Extracted From:

- [Gitlab - Git Cheat Sheet](https://about.gitlab.com/images/press/git-cheat-sheet.pdf)

## Quick tables | Git Configuration 

<table-code>

<table-row-code title="user configuration"  
code='
 git config --global user.name “Your Name”
 git config --global user.email “you@example.com”
 git config --global color.ui auto

'/>

</table-code>

## Quick tables | Starting A Project

<table-code>

<table-row-pre title="git init"
code='
git init [project name]

'/>
<table-row-pre title="git clone"
code='
git clone [project url]
'/>

</table-code>

## Quick tables | Day-To-Day Work

<table-code>

<table-row-code title="Check Status"  
code='
git status
git add [file]
git diff [file]
git diff --staged [file] // Difference with the repository
'/>

<table-row-pre title="Checkout: Discarding Directory" sub="Discard changes in working directory. This operation is unrecoverable"  
code='
git checkout -- [file]
'/>

<table-row-pre title="Reset" sub="Revert your repository to a previous known working state"  
code='
git reset [file]
'/>



</table-code>

## Quick tables | Git branching model

<table-code>

<table-row-pre title="List all local branches" sub="With -a: show all branches
(with remote)."
code='
git branch [-a]
'/>

<table-row-pre title="New Branch" 
code='
git branch [branch_name]
'/>

<table-row-pre title="Switch Branch" sub="Switch working directory to the specified branch. With -b: Git will
create the specified branch if it does not exist"
code='
git checkout [-b][branch_name]
'/>

<table-row-pre title="Delete Branch" sub="Remove selected branch, if it is already merged into any other.
-D instead of -d forces deletion"
code='
git branch -d [name]
'/>

<table-row-pre title="Merge Branch" sub="Join specified [from name] branch into your current branch (the one
you are on currently)."
code='
git merge [from name]
'/>




</table-code>

<!-- TODO: Add other Cheat Tables -->