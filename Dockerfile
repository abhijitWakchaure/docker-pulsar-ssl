FROM apachepulsar/pulsar:2.10.3

# Generated SSL certificates will be placed inside $CERTS_ROOT/certs
ENV CERTS_ROOT /pulsar/data/

# Pulsar Dockerfile (https://github.com/apache/pulsar/blob/master/docker/pulsar/Dockerfile) 
# is setting user ID to 10000
USER 0

RUN apt-get update && apt-get -y upgrade \
	&& apt-get install -y --no-install-recommends curl python3 ca-certificates apt-transport-https \
	&& rm -rf /var/lib/apt/lists/*

ADD ./createCerts.sh ${CERTS_ROOT}
ADD ./update-conf.sh ${CERTS_ROOT}
ADD ./docker-entrypoint-custom.sh /

USER 10000

ENTRYPOINT [ "/docker-entrypoint-custom.sh"]
