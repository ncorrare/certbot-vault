#!/bin/bash
VAULT=$(which vault)
CERTBOT=$(which certbot)

HE_USER=$($VAULT kv get -field username /letsencrypt/auth)
HE_PASS=$($VAULT kv get -field password /letsencrypt/auth)

$CERTBOT certonly  --preferred-challenges dns   --manual-auth-hook /usr/bin/certbot-he-hook.sh    --manual-cleanup-hook /usr/bin/certbot-he-hook.sh    --manual-public-ip-logging-ok --manual --non-interactive --agree-tos --deploy-hook /usr/bin/certbot-vault-hook.sh "$@"
