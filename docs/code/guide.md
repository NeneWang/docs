# Guide

<uni-badge  />

Table of Contents:
[[toc]]

<!-- 
TODO ### Custom Components -->

## Setup

### Requirements
&nbsp;
- [Node](https://nodejs.org/en/download/ )
- [Vue](https://vuejs.org/v2/guide/installation.html)
- [Yarn](https://classic.yarnpkg.com/en/docs/install/#windows-stable)
- [Make](http://gnuwin32.sourceforge.net/packages/make.htm)
- [git](https://git-scm.com/downloads)
- [git-ftp](https://blog.jongallant.com/2017/01/install-git-ftp-windows/)



### Running the Repository on your Local Machine

 1. Make sure you have the requirements installed 
 2. Open your terminal
 3. Clone the repo: ```git clone https://github.com/NeneWang/code-documentation.git```
 4. Navigate to root folder: ```cd code-documentation/ ```
 5. Install Dependencies: ```yarn install```
 6. localhost:```yarn docs:dev``` 


### How to update the documentation (using make)

 1. Save and push changes to the respository: ```make cap m="your build message"```
 2. Build and FTP Trasnfer to production: ```make v="versionID" ``` (versionID is optional)

### How to update the documentation (using github actions)


 1. Make your changes in Master branch
 2. Track your changes ```git add --all```
 3. Commit ```git commit -m "message"```
 4. Push to master branch ```git push origin master```
 5. Checkout deployment branch ```git checkout deployment```
 6. Merge changes made in master into deployment branch ```git merge master```
 7. Push changes to github: ```git push origin HEAD```
 
 Github Actions will automatically build the static files and ftp transfer them into production.

 ::: details Logs showing evidence that the automated deployment worked.
 ![screenshot log](https://i.ibb.co/Gcdcjpw/screencapture-github-Nene-Wang-code-documentation-runs-3315009118-2021-08-12-15-06-40.png)
 :::

 


### Automation using Make
| Action                                               | Code                                              |
| ---------------------------------------------------- | ------------------------------------------------- |
| Deploy to [Production](https://docs.wangnelson.xyz/) | ```make v=<deployment version> ``` <br> e.g: ```make v=1.2``` |
| Commit all and push to github                        | ```make cap m=example```                          |
| Build commit and push to origin (not deploying)      | ```make build-commit v=1.3```                     |
| Push to production                                   | ```make ft-push ```                               |
| Configure FTP settings (page - user - password)      | ```make ftpinit ```                               |
| First deployment to server                           | ```make first-deploy ```                          |
| Build commit and push to origin (not deploying)      | ```make build-commit ```                          |

## Components
### Using VuePress
<br>

- [Vuepress | Official Guide](https://vuepress.vuejs.org/guide/)

Quick Vuepress Commands example:

| Action            | Command       |
| ----------------- | ------------- |
| quick new line    | ```&nbsp;```  |
| Table of contents | ```[[toc]]``` |
| Tip  | ```::: danger STOP Danger zone, do not proceed:::``` <br> (danger, tip, warning, details) |


<!-- Action, Command
quick new line, ```&nbsp;```
Table of contents, ```[[toc]]``` -->





<!-- CSV -->
<!-- action, code
Deploy to Production @https://docs.wangnelson.xyz/, ```make v=<deployment version> e.g: make v=1.2``` 
Commit all and push to github , ```cap m="example"``` 
Build commit and push to origin (not deploying), ```make build-commit v=1.3```
Push to production, ```make ft-push ```
Configure FTP settings (page - user - password), ```make ftpinit ```
First deployment to server, ```make first-deploy ```
Build commit and push to origin (not deploying), ```make build-commit ``` -->

