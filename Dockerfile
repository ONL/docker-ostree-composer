FROM fedora:latest

RUN dnf upgrade -y && \
    dnf install -y \
       rpm-ostree \
       dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/opt/compose.sh"]
