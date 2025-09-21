#!/bin/bash

echo "=== Terraform LocalStack 設定 ==="

cd /workspaces/$1/environments/local

tflocal init
tflocal plan
tflocal apply -auto-approve

echo "=== Terraform LocalStack 設定完了 ==="