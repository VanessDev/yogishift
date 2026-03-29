FROM php:8.4-cli

# Installer extensions MySQL
RUN docker-php-ext-install pdo pdo_mysql

# Installer git + unzip (utile Symfony)
RUN apt-get update && apt-get install -y git unzip

WORKDIR /app