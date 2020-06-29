FROM jboss/keycloak:6.0.1
LABEL maintainer=<your-name>

COPY ./realm/realm.json /tmp/realm.json
ENV KEYCLOAK_IMPORT /tmp/realm.json

COPY ./ssl/tls.crt /etc/x509/https/tls.crt
COPY ./ssl/tls.key /etc/x509/https/tls.key

USER root
RUN mkdir -p /opt/jboss/keycloak/standalone/data
RUN chmod -R a+rw /opt/jboss/keycloak/standalone/data
RUN chown -R 1000 /opt/jboss/keycloak/standalone/data
