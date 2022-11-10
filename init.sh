!/usr/bin/env bash

# setup
mkdir www
cd www
git init -b www
git remote add origin git@github.com:kress95/luajit-wiki.git
git branch -u origin/www www
git pull

# download
wayback_machine_downloader -p 1 http://wiki.luajit.org --to 20220717120825 -d .
find . -name "*.html" -exec sed -i 's|href="/|href="/luajit-wiki/|g' {} +
find . -name "*.html" -exec sed -i 's|src="/|src="/luajit-wiki/|g' {} +

# publish
git add -A .
git commit -m "publish"
git push origin www

cd ..
