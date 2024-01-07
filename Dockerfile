# Use an official PHP runtime as a parent image
FROM php:7.4-apache

# Set the working directory
WORKDIR /var/www/html

# Copy the current directory contents into the container
COPY . /var/www/html

# Install any needed packages specified in requirements.txt
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libpng-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd pdo_mysql