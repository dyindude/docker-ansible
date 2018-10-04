DISTROS=ubuntu debian
ubuntu_builds=bionic xenial trusty
debian_builds=buster stretch jessie
ansible_versions=2.5 2.6 2.7
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
	docker build --build-arg APT_CACHE_PROXY_HOST=$$APT_CACHE_PROXY_HOST --build-arg DISTRO=$$DISTRO --build-arg TAG=$$TAG --build-arg ANSIBLE_VERSION=$$ANSIBLE_VERSION -t dyindude/ansible:$$DISTRO\_$$TAG\_ansible$$ANSIBLE_VERSION .
