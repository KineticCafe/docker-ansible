# docker-ansible Changelog

## 1.0.1 / 2021-06-16

- When creating a run user of `ansible`, it cannot be a `system` user to be able
  to write anything. Changed `adduser` to create a normal user called `ansible`.

- Improved build time by using `COPY --chown=ansible:ansible` in the final
  target image and not running `chown -R` as a separate step.

- Removed an unnecessary tracing step from `run`.

## 1.0 / 2021-05-21

- Initial released version.
