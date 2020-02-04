FROM fedora:latest

ENV YAMLFILE default.yml
ENV REFNAME fedora/31/x86_64/xfce
ENV GPG_HOMEDIR /opt
ENV GPG_KEY ABC12345

RUN dnf upgrade -y && \
    dnf install -y \
       rpm-ostree \
       dumb-init \
    && dnf clean all

WORKDIR /var/defs
ADD files/compose.sh /opt/compose.sh
RUN mkdir -p /var/www && chmod +x /opt/compose.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/opt/compose.sh"]
