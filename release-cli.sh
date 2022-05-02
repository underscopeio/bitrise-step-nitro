#!/bin/bash
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -z "$(printenv 'GITHUB_TOKEN')" ] ; then
  echo "[!] Missing required env: GITHUB_TOKEN"
  exit 1
fi

if [ -z "$1" ] ; then
  echo "[!] Missing required second underscope-ci project 'branch' argument"
  exit 1
fi

if [ -z "$2" ] ; then
  echo "[!] Missing required first 'release name' argument"
  exit 1
fi

BRANCH=$1
RELEASE_NAME=$2

REPO_URL="git@github.com:underscopeio/underscope-ci.git"
REPO_PATH=$(mktemp -d -t)
BUILDER_PATH="$REPO_PATH/packages/builder"
MACOS_FILENAME="nitro-macos"
LINUX_FILENAME="nitro-linux"

git clone "$REPO_URL" --depth=1 --branch="$BRANCH" --single-branch "${REPO_PATH}"

cd "$REPO_PATH"
rm -rf backend web

cd "$BUILDER_PATH"
yarn
yarn dist

cd "$SCRIPT_DIR"
cp "$BUILDER_PATH/dist/$MACOS_FILENAME" ./
cp "$BUILDER_PATH/dist/$LINUX_FILENAME" ./

ls -la

set +e
hub release show "$RELEASE_NAME"

if [[ $? == 1 ]] ; then
    hub release create "$RELEASE_NAME" -m "$RELEASE_NAME" -a "$MACOS_FILENAME" -a "$LINUX_FILENAME"
else
    hub release edit "$RELEASE_NAME" -m '' -a "$MACOS_FILENAME" -a "$LINUX_FILENAME"
fi
