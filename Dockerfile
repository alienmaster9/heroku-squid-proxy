# Use an updated base image
FROM ubuntu:20.04

# Your maintainer and labels here...

ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary packages
RUN apt-get update -y && \
    apt-get install -y squid apache2-utils && \
    apt-get clean

COPY entry.sh /
COPY squid.conf /etc/squid/squid.conf
RUN chmod a+x /entry.sh

EXPOSE 3128/tcp

ENTRYPOINT ["/entry.sh"]
