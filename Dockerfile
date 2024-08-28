# Use the latest PHP image
FROM php:latest

# Set the working directory
WORKDIR /var/www/html

# Copy the application code into the container
COPY . /var/www/html

# Install any necessary dependencies (example: composer)
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && docker-php-ext-install pdo pdo_mysql

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Expose port 80
EXPOSE 80

# Start PHP built-in server
CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]