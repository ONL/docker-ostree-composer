if [ ! -d /var/www/repo ]; then
  mkdir -p /var/www/repo
  mkdir -p /var/www/cache
  ostree --repo=/var/www/repo init --mode=archive
fi

rpm-ostree compose tree --repo=/var/www/repo --cachedir=/var/www/cache ${YAMLFILE}
ostree --repo=/var/www/repo static-delta generate ${REFNAME}
ostree --repo=/var/www/repo static-delta generate --from=${REFNAME}^^ --to=${REFNAME}
ostree --repo=/var/www/repo prune --refs-only --keep-younger-than="6 months ago"
ostree summary --repo=/var/www/repo --update --gpg-homedir=${GPG_HOMEDIR} --gpg-sign=${GPG_KEY}
