PROJECT_NAME=<PROJECT_NAME>

cd .devcontainer/

chmod +x setup_aws.sh apply_terraform.sh

./setup_aws.sh
./apply_terraform.sh $PROJECT_NAME