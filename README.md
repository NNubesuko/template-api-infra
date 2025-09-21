## 編集箇所
> .devcontainer/init.sh
- `PROJECT_NAME=<PROJECT_NAME>`をご自身のプロジェクト名に置き換える

> environments/development/first-deploy.sh
- `PROJECT_NAME=<PROJECT_NAME>`をご自身のプロジェクト名に置き換える

> environments/development/locals.tf
- `project_name = "<PROJECT_NAME>"`をご自身のプロジェクト名に置き換える
- `account_id = "<ACCOUNT_ID>"`をご自身のAWS Account IDに置き換える
- `github_user = "<GITHUB_USER>"`をご自身のGitHubユーザー名に置き換える
- `github_repository = "<GITHUB_REPOSITORY>"`をご自身のGitHubリポジトリ名に置き換える

> environments/local/locals.tf
- `project_name = "<PROJECT_NAME>"`をご自身のプロジェクト名に置き換える

## ローカルのAWSリソース確認

### DynamoDB
以下コマンドでDynamoDBにテーブルが作成されているか確認
```bash
aws dynamodb list-tables --endpoint-url=http://localhost:4566
```

## 初回デプロイ方法

### AWS Configureを設定
```bash
aws configure
```

### 初回デプロイ実行
```bash
bash environments/development/first-deploy.sh
```