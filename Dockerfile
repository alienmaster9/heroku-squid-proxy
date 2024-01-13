# Use the official Heroku stack image
FROM heroku/heroku:22

# Your maintainer and labels here...

# Set environment variables if needed
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary packages
RUN apt-get update -y && \
    apt-get install -y squid apache2-utils && \
    apt-get clean

COPY entry.sh /
COPY squid.conf /etc/squid/squid.conf
RUN chmod a+x /entry.sh

# Expose the port that Squid will listen on
EXPOSE 3128

# Define the command to run your application
CMD ["/entry.sh"]
