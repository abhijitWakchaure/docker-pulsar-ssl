#!/usr/bin/env bash
# Author: Abhijit Wakchaure <awakchau@tibco.com>

echo "
brokerServicePortTls=6651
webServicePortTls=8081
tlsRequireTrustedClientCertOnConnect=true
tlsCertificateFilePath=/pulsar/data/certs/server.crt.pem
tlsKeyFilePath=/pulsar/data/certs/server.key.pem
tlsTrustCertsFilePath=/pulsar/data/certs/rootCA.crt.pem" >> /pulsar/conf/standalone.conf


echo "
# For clients connecting to the proxy
tlsEnabledInProxy=true

# For the proxy to connect to brokers
tlsEnabledWithBroker=true
brokerClientTrustCertsFilePath=/pulsar/data/certs/rootCA.crt.pem" >> /pulsar/conf/standalone.conf

