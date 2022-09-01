#!/usr/bin/env bash
set -eux

# Build the docs.
pdoc --html src/pyfreedb

# Move the docs to the latest docs folder.
rm -rf docs/site/latest
mkdir -p docs/site/latest
cp -R html/pyfreedb/* docs/site/latest

# Copy the docs folder into the correct release version.
mkdir -p docs/site/${RELEASE_VERSION}
cp -R docs/site/latest/* docs/site/${RELEASE_VERSION}

# Remove the original HTML folder.
rm -rf html

tree .