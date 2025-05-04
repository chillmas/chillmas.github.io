#!/data/data/com.termux/files/usr/bin/bash

# タイトルを引数で受け取る
TITLE="$1"

# タイトルがなかったらエラー
if [ -z "$TITLE" ]; then
  echo "使い方: ./new_post.sh \"記事タイトル\""
  exit 1
fi

# スラッグ（日付とファイル名用に変換）
DATE=$(date +%Y-%m-%d)
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' | sed 's/[^a-z0-9-]//g')
FILENAME="_posts/${DATE}-${SLUG}.markdown"

# Markdownテンプレート作成
cat <<EOF > "$FILENAME"
---
layout: post
title: "$TITLE"
date: $(date +"%Y-%m-%d %H:%M:%S %z")
categories: ブログ
---

ここに本文を書く。
EOF

# Gitへ追加＆コミット＆プッシュ
git add "$FILENAME"
git commit -m "新記事追加: $TITLE"
git push origin main

echo "記事を追加しました: $FILENAME"
