#!/usr/bin/env bash
set -eux

# Build the docs.
pdoc --html src/pyfreedb

# Figure out which commit this release is on.
head=$(git rev-parse HEAD)

# Move the docs to the latest docs folder.
rm -rf gh-pages/latest
mkdir -p gh-pages/latest
cp -R html/pyfreedb/* gh-pages/latest

# Copy the docs folder into the correct release version.
mkdir -p gh-pages/${RELEASE_VERSION}
cp -R gh-pages/latest/* gh-pages/${RELEASE_VERSION}

# Remove the original HTML folder.
rm -rf html

tree .

# Handle the file changes in gh-pages branch.
# cd gh-pages
# git add .

# if git diff --staged --quiet; then
#     echo "$0: No changes to commit."
#     exit 0
# fi

# git commit -m "CI: Update docs for release ${RELEASE_VERSION} ($head)"
# git push origin gh-pages