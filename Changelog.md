# [ghcr.io/]kineticcafe/ansible Changelog

## 6.0.0 / 2024-11-01

- Upgraded to Python 3.13

- Upgraded to Ansible 10.5.0

- Changed PDM lock strategy.

## 5.1.0 / 2024-02-27

- Upgraded to Ansible 8.7.0

## 5.0.0 / 2023-11-03

- Upgraded to Python 3.12

- Upgraded to Ansible 8.5.0

- Renamed the `run` script to `kineticcafe-ansible` and fixed several issues:

  - Bash 4 or later is required for associative array support. Ensured that this
    would be respected on macOS by using `/usr/bin/env bash` instead of
    `/bin/bash`.

  - Updated the script to use the current version of the image.

  - Fixed various issues with file and directory mounts. Many more mountable
    files (`--become-password-file`, etc.) are supported than
    `--vault-password-file`. Note that not _all_ possible file parameters are
    supported, such as `--module-paths` or `--extra-vars @file`. Pull requests
    for supporting these would be considered.

  - Fixed an overzealous application of `--ask-vault-password`, even for
    commands that could not use it.

  - Changed the `sh` subcommand to execute `bash` and added `bash` as a known
    subcommand.

  - Added support for deriving the entry point from `basename $0`.

- Updated the Docker image to use HEREDOC.

  - Added `less`, `nano`, and `vim-nox` packages.

- Added an `install` script to install `kineticcafe-ansible` and optional
  symlinks.

## 4.0.0 / 2023-08-04

- Upgraded to Ansible 8.2.0

- Changed from [pipenv][pipenv] to [pdm][pdm] and `pyproject.toml` because of
  ongoing issues with Dependabot not detecting dependencies in `Pipfile.lock` as
  opposed to only in `requirements.txt` (the inverse of
  dependabot/dependabot-core#6200). After trying Poetry (predates the latest
  Python packaging PEPs), rye (experimental), and hatch (no lock file),
  [pdm][pdm] seems to fit the bill best for the limited needs that we have with
  this project.

- Experimentally removed the generated `requirements.txt` file. It isn't used,
  but it has been valuable in getting update notifications from Dependabot,
  although the update PRs are less useful. If required, we can add it back with
  `pdm export -f requirements > requirements.txt`.

## 3.3.0 / 2023-07-17

- Upgraded to Ansible 7.7.0

## 3.2.0 / 2023-06-02

- Upgraded to Ansible 7.6.0

## 3.1.0 / 2023-03-28

- Upgraded to Ansible 7.3.0

- Upgraded to Python 3.11.

## 3.0.0 / 2022-12-26

- Upgraded to Ansible 7.1.0

- Upgraded from Debian Buster (slim) to Debian Bullseye (slim) as the base
  image. Using Python 3.10 instead of Python 3.9.

- Changed from `requirements.txt` to `Pipfile` with [pipenv][pipenv].

- Fixed issues for running the Ansible scripts in a non-interactive environment.

## 2.0.0 / 2022-05-08

- Upgraded to Ansible 5.7.1

- Switched from alpine to Debian Buster (slim) as the base image.

- Removed linux/arm/v7 because of Rust requirements.

- Restricted the `run` script to use a correct tag.

## 1.1.0 / 2021-09-23

- Upgraded to Ansible 4.2.0 via dependendabot.

- Minor modification to the Dockerfile.

## 1.0.1 / 2021-06-16

- When creating a run user of `ansible`, it cannot be a `system` user to be able
  to write anything. Changed `adduser` to create a normal user called `ansible`.

- Improved build time by using `COPY --chown=ansible:ansible` in the final
  target image and not running `chown -R` as a separate step.

- Removed an unnecessary tracing step from `run`.

## 1.0 / 2021-05-21

- Initial released version.

[pipenv]: https://pipenv.pypa.io/en/latest/
[pdm]: https://github.com/pdm-project/pdm
