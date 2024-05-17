# Use the official PHP image with Apache as a base
FROM php:8.1-apache

# Set the working directory inside the container
WORKDIR /var/www/Study-overseas

# Install additional system dependencies
RUN apt-get update && apt-get install -y \
    git \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache modules
RUN a2enmod rewrite

# Install Composer (PHP package manager)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy composer.json and composer.lock to the working directory
COPY composer.json composer.lock ./

# Install project dependencies
RUN composer install --no-scripts --no-autoloader

# Copy the rest of the application code
COPY . .

# Generate autoload files and optimize the project
RUN composer dump-autoload --optimize

# Set permissions
RUN chown -R www-data:www-data /var/www/Study-overseas/storage /var/www/Study-overseas/bootstrap/cache

# Apache configuration
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

# Set the ServerName directive
RUN echo "ServerName 65.0.182.80" >> /etc/apache2/apache2.conf

# Expose port 80 to the outside world
EXPOSE 80

# Run Apache in the foreground
CMD ["apache2-foreground"]

