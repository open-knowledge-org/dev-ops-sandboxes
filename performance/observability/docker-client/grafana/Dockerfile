FROM grafana/grafana:6.2.5
LABEL maintainer=eduardo.mioto

USER root

RUN apt-get update && apt-get install -y curl gettext-base 
RUN apt-get install unzip
RUN rm -rf /var/lib/apt/lists/*

COPY ./datasources /etc/grafana/provisioning/datasources
COPY ./dashboards /etc/grafana/provisioning/dashboards

WORKDIR /app
COPY entrypoint.sh ./
RUN chmod u+x entrypoint.sh

# USER grafana
# USER 472

# ENTRYPOINT ["/app/entrypoint.sh"]
