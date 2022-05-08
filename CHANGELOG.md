# docker-ansible Changelog

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
