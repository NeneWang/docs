# Guide

<uni-badge  />

Table of Contents:
[[toc]]

<!-- 
TODO ### Custom Components -->

## Setup

### Requirements
&nbsp;
- Node
- Vue
- Yarn
- Make
- git-ftp
- git


### Running the Repository on your Local Machine

 1. First you need to clone the 

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
### Using Vue Press
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

