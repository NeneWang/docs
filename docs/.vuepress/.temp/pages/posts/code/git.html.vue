<template><div>
<p> 
 </p>
<ul>
<li>Credits:
<ul>
<li><a href="https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet" target="_blank" rel="noopener noreferrer">Git Bickbucket - Cheatsheet<ExternalLinkIcon/></a></li>
<li><a href="https://about.gitlab.com/images/press/git-cheat-sheet.pdf" target="_blank" rel="noopener noreferrer">Gitlab - Git Cheat Sheet<ExternalLinkIcon/></a></li>
</ul>
</li>
</ul>
<h2 id="🎯-practice" tabindex="-1"><a class="header-anchor" href="#🎯-practice"><span>🎯 Practice</span></a></h2>
<ul>
<li><a href="https://www.w3schools.com/git/exercise.asp" target="_blank" rel="noopener noreferrer">w3school practice | Git<ExternalLinkIcon/></a></li>
</ul>
<h2 id="quick-tables" tabindex="-1"><a class="header-anchor" href="#quick-tables"><span>Quick Tables</span></a></h2>
<br>
Extracted From:
<ul>
<li><a href="https://about.gitlab.com/images/press/git-cheat-sheet.pdf" target="_blank" rel="noopener noreferrer">Gitlab - Git Cheat Sheet<ExternalLinkIcon/></a></li>
</ul>
<h2 id="quick-tables-git-configuration" tabindex="-1"><a class="header-anchor" href="#quick-tables-git-configuration"><span>Quick tables | Git Configuration</span></a></h2>
<table-code>
<table-row-code title="user configuration"  
code='
 git config --global user.name “Your Name”
 git config --global user.email “you@example.com”
 git config --global color.ui auto
<p>'/&gt;</p>
</table-code>
<h2 id="quick-tables-starting-a-project" tabindex="-1"><a class="header-anchor" href="#quick-tables-starting-a-project"><span>Quick tables | Starting A Project</span></a></h2>
<table-code>
<table-row-pre title="git init"
code='
git init [project name]
<p>'/&gt;</p>
<table-row-pre title="git clone"
code='
git clone [project url]
'/>
</table-code>
<h2 id="quick-tables-day-to-day-work" tabindex="-1"><a class="header-anchor" href="#quick-tables-day-to-day-work"><span>Quick tables | Day-To-Day Work</span></a></h2>
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
<h2 id="quick-tables-git-branching-model" tabindex="-1"><a class="header-anchor" href="#quick-tables-git-branching-model"><span>Quick tables | Git branching model</span></a></h2>
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
<!-- TODO: Add other Cheat Tables --></div></template>


