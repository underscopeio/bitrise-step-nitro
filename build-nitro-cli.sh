#!/bin/bash
set -ex

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CREATE_TMP_DIR_CMD=$([[ "$(uname)" == "Darwin" ]] && echo "mktemp -d -t nitro" || echo "mktemp -d -t")
TMP_DIR=$($CREATE_TMP_DIR_CMD)
NITRO_SOURCE_DIR="$SCRIPT_DIR/node_modules/underscope-ci"
NITRO_SOURCE_TMP_DIR="$TMP_DIR/underscope-ci"

cp -R "$NITRO_SOURCE_DIR" "$TMP_DIR"

# Install Nitro dependencies
cd "$NITRO_SOURCE_TMP_DIR"
yarn

# Build Nitro cli
NITRO_BUILDER_TMP_DIR="$NITRO_SOURCE_TMP_DIR/packages/builder"
cd "$NITRO_BUILDER_TMP_DIR"
yarn dist

# Copy Nitro binaries to publish a new release
cd "$SCRIPT_DIR"
rm -rf "$SCRIPT_DIR/dist"
cp -R "$NITRO_BUILDER_TMP_DIR/dist" "$SCRIPT_DIR"

# Remove temp dir
rm -rf "$TMP_DIR"