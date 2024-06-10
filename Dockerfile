FROM php:8.2.12-fpm-alpine

# Install necessary packages
RUN apk add --no-cache \
    nginx \
    supervisor \
    bash \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    libwebp-dev \
    libxpm-dev \
    curl-dev \
    curl \
    libzip-dev \
    oniguruma-dev \
    libxml2-dev \
    libxslt-dev \
    libffi-dev \
    openssl-dev \
    libjpeg \
    libpng \
    freetype \
    libwebp \
    libxpm \
    libzip \
    oniguruma \
    libxml2 \
    libxslt \
    libffi \
    openssl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp --with-xpm \
    && docker-php-ext-install -j$(nproc) \
    curl \
    gd \
    mbstring \
    exif \
    mysqli \
    pdo_mysql \
    zip \
    opcache \
    xsl \
    bcmath

# Install Composer (Specific Version)
RUN curl -sS https://getcomposer.org/download/2.7.6/composer.phar -o /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && /usr/local/bin/composer --version

# Install Drush
RUN composer global require drush/drush

# Configure PHP
#COPY php.ini /usr/local/etc/php/

# Configure Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Configure Supervisor (for managing processes)
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Set Working Directory
WORKDIR /var/www/html

# Expose Ports
EXPOSE 80

# Update PATH for Composer
ENV PATH="/root/.composer/vendor/bin:${PATH}"

# Start Supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

