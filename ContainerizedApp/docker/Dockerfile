# Use official PHP with Apache
FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Copy only the PHP file from GitHub repo folder "src/"
COPY ContainerizedApp/src/index.php /var/www/html/index.php

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
