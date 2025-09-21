# 変数
echo "[INFO] 変数定義"
PROJECT_NAME=<PROJECT_NAME>
ENVIRONMENT=development
AWS_REGION=ap-northeast-1

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REPO=${PROJECT_NAME}-${ENVIRONMENT}-ecr-webapp
REPO_URL=${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${REPO}

echo "[INFO] 開発環境の初回デプロイ"
cd /workspaces/${PROJECT_NAME}/environments/${ENVIRONMENT}
echo "[INFO] Terraform init"
terraform init

# ECR と IAM ロールの作成
terraform apply -target=module.ecr -target=module.iam

# ECR ログイン
echo "[INFO] ECR ログイン"
aws ecr get-login-password --region $AWS_REGION \
| docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

# 公式 Lambda ベースイメージを取得して :dummy と :latest を付けて push
echo "[INFO] 公式 Lambda ベースイメージを取得して :dummy と :latest を付けてプッシュ"
docker pull public.ecr.aws/lambda/nodejs:20
docker tag  public.ecr.aws/lambda/nodejs:20 ${REPO_URL}:dummy
docker tag  public.ecr.aws/lambda/nodejs:20 ${REPO_URL}:latest
docker push ${REPO_URL}:dummy
docker push ${REPO_URL}:latest

echo "[INFO] terraform apply"
terraform apply