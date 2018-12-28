FROM phpdockerio/php71-fpm:latest
#WORKDIR "/application"
# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install php7.1-mysql php-redis php7.1-gd php-imagick php7.1-intl php-mongodb \
    php7.1-xsl php-yaml php-xdebug php7.1-bcmath

# Packages for wkhtmltopdf
RUN apt-get install -y fontconfig libfontconfig1 libfreetype6 libpng12-0 libssl1.0.0 \
    libx11-6 libxext6 libxrender1 xfonts-75dpi xfonts-base xz-utils

# Install git
RUN apt-get -y install git

# Add supervisord config file
#COPY supervisord.conf /etc/supervisord.conf

# Create log directory
#RUN mkdir -p /var/log/supervisor

# Cleanup
RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* \
    && export TERM=xterm

# Apply custom php.ini
COPY php-ini-overrides.ini /etc/php/7.1/fpm/conf.d/99-overrides.ini

# php-fpm - Startup Script
COPY php-fpm-script /usr/bin/php-fpm
RUN chmod +x /usr/bin/php-fpm

# php-fpm - Pool file as root
COPY www.conf /etc/php/7.1/fpm/pool.d/www.conf

# Switch container to superevisord
#ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
# initial is on
CMD /usr/bin/php-fpm

# Expose port for Supervisor and php-fpm
EXPOSE 9000
