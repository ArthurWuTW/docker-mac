REPO_DIR=$(realpath $(realpath $(dirname $PWD)/dependencies))
HOSTNAME=arthur-Dell-System-Inspiron-N4110
DOCKER_DIR=$REPO_DIR
IMAGE_NAME=${IMAGE_NAME:-project_backup_server}
CONTAINER_USER=user
CONTAINER_NAME=project_backup_server

