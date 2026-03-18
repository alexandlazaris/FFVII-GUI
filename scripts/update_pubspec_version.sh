#!/bin/bash
set -e

VERSION=$1
BUILD_NUMBER=${GITHUB_RUN_NUMBER:-1}

CURRENT=$(grep '^version:' pubspec.yaml)
VERSION=$(echo $CURRENT | cut -d '+' -f 1 | cut -d ' ' -f 2)
echo "Existing VERSION: $VERSION"
CURRENT_BUILD_NUMBER=$(echo $CURRENT | cut -d '+' -f 2)
echo "Existing BUILD NUMBER: $CURRENT_BUILD_NUMBER"

if [ -z "$VERSION" ]; then
  echo "❌ ERROR: VERSION is empty. semantic-release did not provide nextRelease.version"
  exit 1
fi

echo "Updating app version to: $VERSION+$BUILD_NUMBER"

sed -i "s/^version:.*/version: $VERSION+$BUILD_NUMBER/" pubspec.yaml