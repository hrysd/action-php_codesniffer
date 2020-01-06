#!/bin/sh

cd "${GITHUB_WORKSPACE}" || exit

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

php phpcs.phar --standard=PSR12 --extensions=php --report=checkstyle -q \
  | reviewdog -name=PHP_CodeSniffer -f=checkstyle -reporter=github-pr-check -diff='git diff'
