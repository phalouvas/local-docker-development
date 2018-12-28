FROM phpdockerio/php71-cli:latest
#WORKDIR "/application"
# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install php7.1-mysql php-redis php7.1-gd php-imagick php7.1-intl php-mongodb php7.1-xsl php-yaml

# Packages for wkhtmltopdf
#RUN apt-get install -y fontconfig libfontconfig1 libfreetype6 libpng12-0 libssl1.0.0 \
#    libx11-6 libxext6 libxrender1 xfonts-75dpi xfonts-base xz-utils

# Install supervisor
RUN apt-get -y install cron supervisor

# Add supervisord config file
COPY supervisord.conf /etc/supervisord.conf

# Create log directory
RUN mkdir -p /var/log/supervisor

# Configure CRON and fix permissions
COPY cron_root /var/spool/cron/crontabs/root
RUN chown root:crontab /var/spool/cron/crontabs/root
RUN chmod 600 /var/spool/cron/crontabs/root

# Cleanup
RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* \
    && export TERM=xterm

# Apply custom php.ini
COPY php-ini-overrides.ini /etc/php/7.1/cli/conf.d/99-overrides.ini

# GeoIP script and set executable
COPY update_geoip_databases.sh /opt/update_geoip_databases.sh
RUN chmod +x /opt/update_geoip_databases.sh

# Switch container to superevisord
ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
# initial is on
#CMD /usr/bin/php-fpm

# Expose port for Supervisor and php-fpm
EXPOSE 8001
