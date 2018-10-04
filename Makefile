DISTROS=ubuntu debian
ubuntu_builds=bionic xenial trusty
debian_builds=jessie
ansible_versions=1.6 2.0 2.4 2.6
TARGETS = $(foreach d,$(DISTROS), \
		$(foreach b,$($(d)_builds), \
		$(foreach v,$(ansible_versions), \
		$(d)_$(b)_$(v))))

.PHONY: all
all: ${TARGETS}
.PHONY: ${TARGETS}
${TARGETS}:
	echo $@
	DISTRO=$$(echo $@ | cut -d "_" -f 1) ; \
	TAG=$$(echo $@ | cut -d "_" -f 2) ; \
	ANSIBLE_VERSION=$$(echo $@ | cut -d "_" -f 3) ; \
    docker build --build-arg DISTRO=$$DISTRO --build-arg TAG=$$TAG --build-arg ANSIBLE_VERSION=$$ANSIBLE_VERSION -t ubuntu:$$TAG\_ansible$$ANSIBLE_VERSION .
