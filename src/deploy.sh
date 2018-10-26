#!/usr/bin/env bash
rm -rf ../public
gulp-oasis --run compress
gulp-oasis --run atlas
gulp-oasis --run minify_css
gulp-oasis --run minify_js
cp *.html ../public
cp js/jquery-1.10.2.min.js ../public/js
sed -i '' '/<link.*stylesheet.*>/d' ../public/index.html
sed -i '' 's/<!--css-->/<link href="css\/index.min.css" rel="stylesheet">/g' ../public/index.html
sed -i '' '/<link.*stylesheet.*>/d' ../public/detail.html
sed -i '' 's/<!--css-->/<link href="css\/detail.min.css" rel="stylesheet">/g' ../public/detail.html
sed -i '' '/<script.*replace.*>/d' ../public/detail.html
sed -i '' 's/<!--js-->/<script src="js\/detail.min.js"><\/script>/g' ../public/detail.html