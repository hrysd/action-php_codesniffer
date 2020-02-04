#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ]; then
  cd "${GITHUB_WORKSPACE}" || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

php /usr/local/bin/phpcs.phar --standard=${INPUT_STANDARD} --extensions=php --report=checkstyle -q ${INPUT_TARGET_DIRECTORY} \
  | reviewdog -name=PHP_CodeSniffer -f=checkstyle -reporter=${INPUT_REPORTER} -level=${INPUT_LEVEL} -diff='git diff'
