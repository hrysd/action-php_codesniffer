# GitHub Action: Run PHP\_CodeSniffer with reviewdog

This action runs [PHP\_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) with [reviewdog](https://github.com/reviewdog/reviewdog).

[![Test](https://github.com/hrysd/action-php_codesniffer/workflows/Test/badge.svg)](https://github.com/hrysd/action-php_codesniffer/actions?query=workflow%3ATest)
[![reviewdog](https://github.com/hrysd/action-php_codesniffer/workflows/reviewdog/badge.svg)](https://github.com/hrysd/action-php_codesniffer/actions?query=workflow%3Ahrysd)
[![depup](https://github.com/hrysd/action-php_codesniffer/workflows/depup/badge.svg)](https://github.com/hrysd/action-php_codesniffer/actions?query=workflow%3Adepup)
[![release](https://github.com/hrysd/action-php_codesniffer/workflows/release/badge.svg)](https://github.com/hrysd/action-php_codesniffer/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/hrysd/action-php_codesniffer?logo=github&sort=semver)](https://github.com/hrysd/action-php_codesniffer/releases)
[![action-bumpr supported](https://img.shields.io/badge/bumpr-supported-ff69b4?logo=github&link=https://github.com/haya14busa/action-bumpr)](https://github.com/haya14busa/action-bumpr)

![github-pr-review demo](https://user-images.githubusercontent.com/1663465/73769679-6b6ec000-47be-11ea-8481-34381232ad65.png)
![github-pr-check demo](https://user-images.githubusercontent.com/1663465/73769700-7164a100-47be-11ea-9580-ecf9da5575e8.png)


## Inputs

### `github_token`

**Required**. Must be in form of `github_token: ${{ secrets.github_token }}`

### `level`

Optional. Report level for reviewdog [info,warning,error].
It's same as `-level` flag of reviewdog.

### `reporter`

Reporter of reviewdog command [github-pr-check,github-check,github-pr-review].
Default is github-pr-check.
It's same as `-reporter` flag of reviewdog.

### `standard`

**Required**. Coding standard or path to PHP\_CodeSniffer's configuration file

### `target_directory`

**Required**. Directory to run PHP\_CodeSniffer

## Example Usage

### [.github/workflows/reviewdog.yml](.github/workflows/reviewdog.yml)

```yaml
name: reviewdog
on: [pull_request]

jobs:
  php_codesniffer:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: hrysd/action-php_codesniffer@v1
        with:
          github_token: ${{ secrets.github_token }}
          standard: PSR12
          target_directory: src
```

## Development

### Release

#### [haya14busa/action-bumpr](https://github.com/haya14busa/action-bumpr)
You can bump version on merging Pull Requests with specific labels (bump:major,bump:minor,bump:patch).
Pushing tag manually by yourself also work.

#### [haya14busa/action-update-semver](https://github.com/haya14busa/action-update-semver)

This action updates major/minor release tags on a tag push. e.g. Update v1 and v1.2 tag when released v1.2.3.
ref: https://help.github.com/en/articles/about-actions#versioning-your-action

### Lint - reviewdog integration

This reviewdog action template itself is integrated with reviewdog to run lints
which is useful for Docker container based actions.

![reviewdog integration](https://user-images.githubusercontent.com/3797062/72735107-7fbb9600-3bde-11ea-8087-12af76e7ee6f.png)

Supported linters:

- [reviewdog/action-shellcheck](https://github.com/reviewdog/action-shellcheck)
- [reviewdog/action-hadolint](https://github.com/reviewdog/action-hadolint)
- [reviewdog/action-misspell](https://github.com/reviewdog/action-misspell)

### Dependencies Update Automation
This repository uses [haya14busa/action-depup](https://github.com/haya14busa/action-depup) to update
reviewdog version.

[![reviewdog depup demo](https://user-images.githubusercontent.com/3797062/73154254-170e7500-411a-11ea-8211-912e9de7c936.png)](https://github.com/reviewdog/action-template/pull/6)

