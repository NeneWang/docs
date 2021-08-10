# Guide

<uni-badge  />

Table of Contents:
[[toc]]

## Components
### Using Vue Press
<br>
- [Official Documentation](https://v1.vuepress.vuejs.org/)

Useful reminders:

Action, Command
quick new line, ```&nbsp;```
Table of contents, ```[[toc]]```



### Custom Components

## Automation and Development

### Requirements
&nbsp;
- Node
- Vue
- Yarn
- Make
- git-ftp
- git



### Makefile
| action                                               | code                                              |
| ---------------------------------------------------- | ------------------------------------------------- |
| Deploy to [Production](https://docs.wangnelson.xyz/) | ```make v=<deployment version> e.g: make v=1.2``` |
| Commit all and push to github                        | ```make cap m=example```                          |
| Build commit and push to origin (not deploying)      | ```make build-commit v=1.3```                     |
| Push to production                                   | ```make ft-push ```                               |
| Configure FTP settings (page - user - password)      | ```make ftpinit ```                               |
| First deployment to server                           | ```make first-deploy ```                          |
| Build commit and push to origin (not deploying)      | ```make build-commit ```                          |



## Workflow



<!-- CSV -->
<!-- action, code
Deploy to Production @https://docs.wangnelson.xyz/, ```make v=<deployment version> e.g: make v=1.2``` 
Commit all and push to github , ```cap m="example"``` 
Build commit and push to origin (not deploying), ```make build-commit v=1.3```
Push to production, ```make ft-push ```
Configure FTP settings (page - user - password), ```make ftpinit ```
First deployment to server, ```make first-deploy ```
Build commit and push to origin (not deploying), ```make build-commit ``` -->

