# [ghcr.io/]kineticcafe/ansible: Ansible in Docker

This is a simple Docker container that contains [Ansible][]. It has been created
so that it's easier to work with `ansible-playbook` without going through the
effort of installing it on various systems.

The image is based on Debian Bookworm (slim) and includes:

- Ansible 8.7.0
- Python 3.12

These images can be pulled either from Docker Hub
(`kineticcafe/ansible:5.0`) or the GitHub Container Registry
(`ghcr.io/kineticcafe/ansible:5.0`).

## Support

Tests have been made on Ubuntu 18 and macOS 13 (Apple Silicon).

Because of recent changes to cryptographic packages in Python, support for
`linux/arm/v7` has been dropped.

## `kineticcafe-ansible` script Commands

The `kineticcafe-ansible` script is recommended for running everything as it
manages environment variable configuration for each run. The
`kineticcafe-ansible` script will pull from `ghcr.io/kineticcafe/ansible:5.0` by
default; this can be overridden by using `$IMAGE`:

```sh
$ IMAGE=kineticcafe/ansible:latest ./kineticcafe-ansible --version
```

### Installing `kineticcafe-ansible`

`kineticcafe-ansible` can be installed with symlinks using the `install` script:

```sh
curl -sSL --fail \
  https://raw.githubusercontent.com/KineticCafe/docker-ansible/main/install |
  bash -s -- ~/.local/bin
```

Replace `~/.local/bin` with your preferred binary directory.

By default, it will download `kineticcafe-ansible` from GitHub and install it in
the provided `TARGET` and make symbolic links for the following Ansible
commands: `ansible`, `ansible-community`, `ansible-config`,
`ansible-connection`, `ansible-console`, `ansible-doc`, `ansible-galaxy`,
`ansible-inventory`, `ansible-playbook`, `ansible-pull`, `ansible-test`, and
`ansible-vault`. Symbolic link creation will not overwrite files or symbolic
links to locations _other_ than `TARGET/kineticcafe-ansible`.

`--no-symlinks` (`-S`) may be specified to skip symbolic link creation entirely.

`--force` (`-f`) may be specified to install `kineticcafe-ansible` even if it already
exists, and to overwrite files and non-`TARGET/kineticcafe-ansible` symbolic links.

`--verbose` (`-v`) will turn on trace output of commands.

## Maintenance/Upgrade Instructions

1. Install [pdm][]: `pipx install pdm`.

2. Edit the `Dockerfile` to update the Python version, if required.

3. Edit the `pyproject.toml` to change the dependencies and update the
   `project.version`.

4. Run `pdm update`.

5. Update `CHANGELOG.md` and `README.md` as required.

[ansible]: https://www.ansible.com/community
[pdm]: https://github.com/pdm-project/pdm
