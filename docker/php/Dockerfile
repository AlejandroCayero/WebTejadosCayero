# 1. Usamos la versión 8.2 de PHP (Estable y rápida)
FROM php:8.2-fpm

# 2. Instalamos herramientas del sistema operativo (Linux)
# Necesarias para descargar cosas y manipular imágenes
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev

# 3. Limpiamos la basura de la instalación anterior para que pese menos
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# 4. Instalamos las extensiones de PHP que pide October CMS
# (GD para imágenes, PDO para base de datos, ZIP para descomprimir)
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# 5. Instalamos COMPOSER (El gestor de paquetes de PHP)
# Vital para instalar October CMS después
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 6. Definimos la carpeta de trabajo
WORKDIR /var/www/html
