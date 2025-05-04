#!/data/data/com.termux/files/usr/bin/bash

cd ~/chilmas.github.io
git add .
git commit -m "ブログ自動更新：$(date)"
git push

echo "GitHub Pages に反映したよ！"
