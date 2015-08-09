#!/bin/sh

# Quit on errors.
set -e errexit
ulimit -n 10240

# Cleans dist directory.
rm -rf dist
# Runs webpack with production configuration.
ANIMATIONS_DISABLED=$ANIMATIONS_DISABLED node_modules/.bin/webpack --stats --progress --config ./webpack/prod.config.js

mkdir dist
cp -R public/* dist
cp -R lambda/* dist
cp -R src dist
cp -R server dist
cp -R node_modules dist