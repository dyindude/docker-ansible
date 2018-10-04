# docker-ansible
Project for building docker images of ansible in the following image/tag permutations:

```
ubuntu_builds=bionic xenial trusty
debian_builds=jessie
ansible_versions=2.5 2.6 2.7
```

Running `make all` will generate all images, or specific targets can be made with `make ${DISTRO}_${TAG}_${ANSIBLE_VERSION}`

# examples

```
make all
make ubuntu_bionic_2.6
make debian_jessie_2.5
```

# notes
I am only targeting the versions to the ones officially supported by [Ansible](https://docs.ansible.com/ansible/latest/reference_appendices/release_and_maintenance.html). While older versions might work, the Dockerfile would need to be updated to install other dependencies (python2, libffi-dev, libssl-dev, etc)
