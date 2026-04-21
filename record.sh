#!/bin/sh
if ! git diff-index --quiet HEAD --; then
    echo "tree is dirty."
    exit 1
fi
HASH=$(git rev-parse --short HEAD)
for file in "$@"; do
    cp "$file" history/"${file%.out.s}".${HASH}.s
done
