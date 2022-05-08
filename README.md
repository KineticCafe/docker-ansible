# Ansible in Docker

This is a simple Docker container that contains [Ansible]. It has been created
so that it's easier to work with `ansible-playbook` without going through the
effort of installing it on various systems.

The image is based on Debian Slim and includes:

- Ansible 5.7.1

## Support

Tests have been made on Ubuntu 18 and macOS 11 (Apple Silicon). More tests are
underway.

Because of recent changes to cryptographic packages in Python, support for
linux/arm/v7 has been dropped.

[ansible]: https://www.ansible.com/community
