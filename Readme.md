
# Lab 5.3

Useful Links
- Online Guide can also be found [here](https://docs.wangnelson.xyz/code/guide.html).
- [Live demo of this Lab](https://docs.wangnelson.xyz/)
- [Integration File](https://github.com/NeneWang/code-documentation/blob/master/.github/workflows/integration.yml)


Table of Contents
- [Lab 5.3](#lab-53)
  - [Setup](#setup)
    - [Requirements](#requirements)
    - [Running the Repository on your Local Machine](#running-the-repository-on-your-local-machine)
  - [Updating](#updating)
    - [How to update the documentation (using make)](#how-to-update-the-documentation-using-make)
    - [How to update the documentation (using github actions)](#how-to-update-the-documentation-using-github-actions)
    - [Logs showing evidence that the automated deployment worked.](#logs-showing-evidence-that-the-automated-deployment-worked)
  - [How the Configuration Files Works](#how-the-configuration-files-works)
    - [Integration.yml](#integrationyml)
    - [Makefile](#makefile)
    - [Automation (and integration) using Make](#automation-and-integration-using-make)

## Setup

### Requirements
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


## Updating

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

 ### Logs showing evidence that the automated deployment worked.

![Github Screenshot](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/fabb00c7-0e05-4f49-979c-03e35f54e544/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210812%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210812T213102Z&X-Amz-Expires=86400&X-Amz-Signature=e895148b207f59489f38269ffc426574d451085fb7d29c0025a38f77fbe7cd7c&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

 ![screenshot log](https://i.ibb.co/Gcdcjpw/screencapture-github-Nene-Wang-code-documentation-runs-3315009118-2021-08-12-15-06-40.png)


## How the Configuration Files Works

 ### Integration.yml
 The Continuous Integration works by using a combination of the makefile and Github Actions. Everytime that code is pushed or a pull ruest event occurs in the deployment branch the integration.yml runs the makefile to install dependencies, build static files and Transfers them to the deployment server using git ftp. (It transfer to my Hostinger CPanel)
```
 # The integration deploys to cloud every time changes are pushed to deployment branch

# Environment Variables: https://stackoverflow.com/questions/60942067/get-current-date-and-time-in-github-workflows

name: Continuous Integration
on:
  push:
    branches: deployment
  pull_request:
    branches: deployment
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2   
      - name: Run Makefile deploy
        run: |
          git config --global user.name "nenewang"
          make build-commit-donpush
          make ft-configpush
```


### Makefile


### Automation (and integration) using Make
| Action                                               | Code                                                          |
| ---------------------------------------------------- | ------------------------------------------------------------- |
| Deploy to [Production](https://docs.wangnelson.xyz/) | ```make v=<deployment version> ``` <br> e.g: ```make v=1.2``` |
| Commit all and push to github                        | ```make cap m=example```                                      |
| Build commit and push to origin (not deploying)      | ```make build-commit v=1.3```                                 |
| Push to production                                   | ```make ft-push ```                                           |
| Configure FTP settings (page - user - password)      | ```make ftpinit ```                                           |
| First deployment to server                           | ```make first-deploy ```                                      |
| Build commit and push to origin (not deploying)      | ```make build-commit ```                                      |
| Deploy to Heroky                                     | ```make deploy-heroku```                                      |
| Build application and commit changes only            | ```make build-commit-donpush```                               |
| Merge Master to Deployment, switch to master branch  | ```make merge-to-deployment```                                |


makefile
``` makefile
PAGE=wangnelson.xyz/documentation/dist

# Requrements: git-ftp, yarn, node

main: build-commit ft-push

deploy-heroku:
	yarn docs:build
	git add --all
	git commit -m "Build Deployment | {$v}"
	git push origin HEAD
	git push heroku head:master


build-commit:
	yarn docs:build
	git add --all
	git commit -m "Production update | ${v}"	
	git push origin HEAD

build-commit-donpush:
	yarn install
	yarn docs:build
	git add --all
	git commit -m "Production update | ${v}"


merge-to-deployment:
	git checkout deployment
	git pull
	git merge master
	git push origin HEAD
	git checkout master


ft-push:
	git ftp push 
	echo "open in https://docs.wangnelson.xyz/" && git log -n 2
	
ft-configpush:
	git config git-ftp.url ftp://ftp.${PAGE}
	git config git-ftp.user ftp_public@wangnelson.xyz
	git config git-ftp.password ZA.m6e{,U6XG
	git config git-ftp.syncroot docs/.vuepress/dist/
	git ftp push --force

ftpinit:
	git config git-ftp.url ftp://ftp.${PAGE}
	git config git-ftp.user ftp_public@wangnelson.xyz
	git config git-ftp.password ZA.m6e{,U6XG
	git config git-ftp.syncroot docs/.vuepress/dist/
	git ftp init --force

first-deploy:
	ftpinit
	git ftp push

cap:
	git add --all
	git commit -m "${m}"
	git push origin HEAD
	git log -n 2


```