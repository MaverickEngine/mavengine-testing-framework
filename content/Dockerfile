FROM wordpress:cli

# Make docker-compose wait for container dependencies be ready
# Add the wait script to the image
USER root
ENV WAIT_VERSION 2.7.2
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait /wait
RUN chmod +x /wait

# Create /etc/X11/fs/.wp-cli/packages directory
RUN mkdir -p /etc/X11/fs/.wp-cli/packages
RUN chown -R 33:33 /etc/X11/fs/.wp-cli
RUN mkdir /etc/X11/fs/.composer
RUN chown -R 33:33 /etc/X11/fs/.composer

# Add sh script to scripts dir
ADD generate_content.sh /scripts/
RUN chmod +x /scripts/generate_content.sh

# Copy fixtures.yml
RUN mkdir /data
COPY fixtures.yml /data/

# Run as wp user
USER 33:33
