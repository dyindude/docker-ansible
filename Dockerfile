ARG  IMAGE
ARG  TAG
FROM $IMAGE:$TAG
ARG  ANSIBLE_VERSION

RUN apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get -y install python3 python3-pip && \
    pip3 install --upgrade pip ansible==${ANSIBLE_VERSION} && \
    rm -rf /var/lib/apt/lists/*

ENV HOME /root

WORKDIR /root

CMD ["bash"]
