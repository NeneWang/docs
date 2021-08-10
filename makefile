deploy-heroku:
	yarn docs:build
	git add --all
	git commit -m "Build Deployment | {$v}"
	git push origin HEAD
	git push heroku head:master
