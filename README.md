# OSTree Composer
Docker container to compose OSTree images

You can use this image to build something like https://pagure.io/workstation-ostree-config/tree/f31 and serve the results with a webserver.

Example Usage:
`docker run -e YAMLFILE=default.yml -e REFNAME=fedora/31/x86_64/xfce -e GPG_HOMEDIR=/opt -e GPG_KEY=ABC12345 -v $localconfigdir:/var/defs -v $localrepo:/var/www paulritter/ostree-composer`
