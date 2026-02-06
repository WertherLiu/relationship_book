#!/usr/bin/env bash
set -euo pipefail

QUARTO_VERSION="1.8.27"
QUARTO_TGZ="quarto-${QUARTO_VERSION}-linux-amd64.tar.gz"
QUARTO_URL="https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/${QUARTO_TGZ}"

echo "==> Download Quarto ${QUARTO_VERSION}"
curl -L -o "${QUARTO_TGZ}" "${QUARTO_URL}"

echo "==> Extract Quarto"
rm -rf .quarto-cli
mkdir -p .quarto-cli
tar -xzf "${QUARTO_TGZ}" -C .quarto-cli --strip-components=1

echo "==> Quarto version"
./.quarto-cli/bin/quarto --version

echo "==> Render book (HTML only)"
./.quarto-cli/bin/quarto render

echo "==> Build output check"
test -f _book/index.html && echo "OK: _book/index.html exists"
