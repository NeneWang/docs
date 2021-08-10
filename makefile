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


ft-push:
	git ftp push
	echo "open in https://docs.wangnelson.xyz/" && git log -n 2
	

ftpinit:
	git config git-ftp.url ftp://ftp.${PAGE}
	git config git-ftp.user ftp_public@wangnelson.xyz
	git config git-ftp.password ZA.m6e{,U6XG
	git config git-ftp.syncroot docs/.vuepress/dist/
	git ftp init

first-deploy:
	ftpinit
	git ftp push

cap:
	git add --all
	git commit -m "${m}"
	git push origin HEAD
	git log -n 2
