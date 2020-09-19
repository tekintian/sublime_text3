#!/bin/bash
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)

DATETIME=$(date +"%Y-%m-%dT%H:%M:%S")

rm -f ${SHELL_FOLDER}/.git/index.lock
# change workdir to git
echo "go into ${SHELL_FOLDER}"
cd $SHELL_FOLDER

# up to latest
git pull

# download latest channel_v3.json
echo "download channel_v3.json to ${SHELL_FOLDER}/channel_v3.json"
curl -o ${SHELL_FOLDER}/channel_v3.json https://packagecontrol.io/channel_v3.json

echo "download Package Control.sublime-package to ${SHELL_FOLDER}/Package Control.sublime-package"
curl -o "${SHELL_FOLDER}/Package Control.sublime-package" https://packagecontrol.io/Package%20Control.sublime-package

# push git
echo "ready to update remote"
git status
git add .
git commit -m "update ${DATETIME}"
git push

echo "done"
