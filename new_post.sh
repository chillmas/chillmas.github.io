#!/data/data/com.termux/files/usr/bin/bash

echo "記事タイトルを入力してね（例：my-first-post）:"
read title

filename="_posts/$(date +%Y-%m-%d)-$title.md"

cat <<EOF > $filename
---
layout: post
title: "$title"
date: $(date '+%Y-%m-%d %H:%M:%S %z')
categories: ブログ
tags: []
---

こんにちは、ちるますです。

ここに本文を書いてね。

それではまた、ちるますでした！
EOF

echo "記事作ったよ！→ $filename"
