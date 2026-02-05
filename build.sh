#!/usr/bin/env bash
set -euo pipefail

QUARTO_VERSION="1.5.57"
QUARTO_DEB="quarto-${QUARTO_VERSION}-linux-amd64.deb"

echo "==> Download Quarto ${QUARTO_VERSION}"
curl -L -o "${QUARTO_DEB}" "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/${QUARTO_DEB}"

echo "==> Install Quarto"
sudo dpkg -i "${QUARTO_DEB}"

echo "==> Quarto version"
quarto --version

echo "==> Render book"
quarto render
