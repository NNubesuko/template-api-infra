#!/bin/bash

echo "=== AWS CLI 設定 ==="

# AWS CLI 設定ディレクトリを作成
mkdir -p ~/.aws

# config ファイル作成
cat > ~/.aws/config <<EOL
[default]
region = ap-northeast-1
output = json
EOL

# credentials ファイル作成
cat > ~/.aws/credentials <<EOL
[default]
aws_access_key_id = DUMMY
aws_secret_access_key = DUMMY
EOL

echo "=== AWS CLI 設定完了 ==="
