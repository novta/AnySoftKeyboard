#!/usr/bin/env bash
set -e

wget --tries=5 --waitretry=5 --progress=dot:mega --output-document=codecov.sh https://codecov.io/bash
chmod +x codecov.sh

COV_FILES=$(find . -name "test*UnitTestCoverage.xml" | xargs -n 1 echo -n " -f ")
./scripts/retry.sh 5 ./codecov.sh -X gcov -X coveragepy -X xcode ${COV_FILES}
