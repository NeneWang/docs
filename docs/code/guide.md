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


### How to update the documentation




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

