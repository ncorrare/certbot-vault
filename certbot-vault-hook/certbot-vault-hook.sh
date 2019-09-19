#!/bin/bash
#Find Vault Binary
VAULT=$(which vault)

#Get domain from certbot's deploy hook
DOMAIN=$(basename $RENEWED_LINEAGE)

$VAULT kv put /letsencrypt/$DOMAIN cert=@$RENEWED_LINEAGE/cert.pem chain=@$RENEWED_LINEAGE/chain.pem fullchain=@$RENEWED_LINEAGE/fullchain.pem privkey=@$RENEWED_LINEAGE/privkey.pem
