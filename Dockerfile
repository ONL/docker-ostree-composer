FROM fedora:latest

RUN dnf upgrade -y && \
    dnf install -y \
       rpm-ostree \
       dumb-init

WORKDIR /opt
ADD files/compose.sh /opt/compose.sh
RUN chmod +x /opt/compose.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/opt/compose.sh"]
