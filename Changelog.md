# [ghcr.io/]kineticcafe/ansible Changelog

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

- Changed from `requirements.txt` to `Pipfile` with pipenv.

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
