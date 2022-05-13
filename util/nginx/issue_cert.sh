#!/bin/sh

. "/root/.acme.sh/acme.sh.env"

export Ali_Key=${KEY}
export Ali_Secret=${SECRET}

/root/.acme.sh/acme.sh --issue --dns dns\_ali -d domain.example.net -d *.${DOMAIN}
/root/.acme.sh/acme.sh --installcert -d ${DOMAIN} -d *.${DOMAIN} \
--keypath /etc/pki/nginx/private/${DOMAIN}.key \
--fullchainpath /etc/pki/nginx/${DOMAIN}.cer

systemctl restart nginx

curl -vI https://${DOMAIN}
