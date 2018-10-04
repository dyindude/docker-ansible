ARG  DISTRO
ARG  TAG
FROM $DISTRO:$TAG
ARG  ANSIBLE_VERSION
ARG  APT_CACHE_PROXY_HOST=null

ENV APT_CACHE_PROXY_HOST ${APT_CACHE_PROXY_HOST}
RUN if [ "$APT_CACHE_PROXY_HOST" != "null" ]; then \
      echo "Acquire::http::Proxy \"http://${APT_CACHE_PROXY_HOST}:3142\";" | tee /etc/apt/apt.conf.d/01proxy ; \
    fi
RUN apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get -y install \
      python3 \
      python3-pip \
      libssl-dev \
      libffi-dev && \
    pip3 install --upgrade pip ansible==${ANSIBLE_VERSION}.* && \
    rm -rf /var/lib/apt/lists/*

ENV HOME /root

WORKDIR /root

ENTRYPOINT ["ansible-playbook"]
