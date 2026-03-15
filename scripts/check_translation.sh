#!/usr/bin/env bash

set -e

echo "Checking XHTML validity..."

for f in src/epub/text/*.xhtml
do
    xmllint --noout "$f"
done

echo "Checking for remaining English quotes..."

grep -R '"' src/epub/text || true

echo "Checking for untranslated 'Holmes said' patterns..."

grep -Ri "Holmes said" src/epub/text || true

echo "Check complete."
