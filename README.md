# GitHub Action: Run PHP\_CodeSniffer with reviewdog

This action runs [PHP\_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) with [reviewdog](https://github.com/reviewdog/reviewdog).

## Example

```yml
name: reviewdog
on: [pull_request]

jobs:
  php_codesniffer:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: hrysd/action-php_codesniffer@master
        with:
          github_token: ${{ secrets.github_api_token }}
          target_directory: src
```
