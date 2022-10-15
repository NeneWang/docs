PAGE=wangnelson.xyz/documentation/dist

# Requrements: git-ftp, yarn, node

ftp_user=ftp_public@wangnelson.xyz
ftp_pass=ZA.m6e{,U6XG


main: build-commit ft-push


start:
	yarn run docs:dev

save:
	git add --all
	git commit -m "Some Random Progress :tada:"
	git push origin HEAD


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
	git config git-ftp.user ${ftp_user}
	git config git-ftp.password ${ftp_pass}
	git config git-ftp.syncroot docs/.vuepress/dist/
	git ftp push --force

ftpinit:
	git config git-ftp.url ftp://ftp.${PAGE}
	git config git-ftp.user ${ftp_user}
	git config git-ftp.password ${ftp_pass}
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

