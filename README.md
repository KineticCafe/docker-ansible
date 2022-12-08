# Ansible in Docker

This is a simple Docker container that contains [Ansible]. It has been created
so that it's easier to work with `ansible-playbook` without going through the
effort of installing it on various systems.

The image is based on Debian Bullseye (slim) and includes:

- Ansible 7.1.0
- Python 3.10

## Support

Tests have been made on Ubuntu 18 and macOS 13 (Apple Silicon).

Because of recent changes to cryptographic packages in Python, support for
linux/arm/v7 has been dropped.

## Upgrade Instructions

1. Edit the `Dockerfile` to update the Python version, if required.

2. Edit the `Pipfile` to change the requirements, if required.

3. Run `pipenv update`.

4. Run `pipenv requirements > requirements.txt`.

5. Update `CHANGELOG.md` and `README.md` as required.

[ansible]: https://www.ansible.com/community
