FROM arm32v7/debian:stable
COPY qemu-arm-static /usr/bin

RUN apt-get update -qq && apt-get install certbot curl unzip -qq
RUN curl -o vault.zip https://releases.hashicorp.com/vault/1.2.3/vault_1.2.3_linux_arm.zip && unzip vault.zip && cp vault /usr/local/bin/vault
RUN curl -o /usr/bin/certbot-he-hook.sh https://raw.githubusercontent.com/angel333/certbot-he-hook/master/certbot-he-hook.sh && chmod +x /usr/bin/certbot-he-hook.sh 
RUN curl -o envconsul.zip https://releases.hashicorp.com/envconsul/0.9.0/envconsul_0.9.0_linux_arm.zip && unzip envconsul.zip && cp envconsul /usr/local/bin/envconsul
COPY certbot-vault-hook/certbot-vault-hook.sh /usr/bin/certbot-vault-hook.sh
RUN chmod +x /usr/bin/certbot-vault-hook.sh
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
