rm -rf dist &&
yarn build &&
cd dist &&
git init &&
git add . &&
git commit -m 'first commit' &&
git branch -M main &&
git remote add origin git@github.com:haQzz/gulu-ui-website-1.git
git push -f -u origin main &&
cd ..
echo https://haqzz.github.io/gulu-ui-website-1/index.html#/