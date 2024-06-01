FROM php:8.0.20-apache


RUN apt-get update && apt-get install -y net-tools vim curl iputils-ping wget curl iproute2 ssl-cert python3.9 pip && \
    docker-php-ext-install mysqli sockets

RUN pecl install xdebug-3.2.1 
RUN docker-php-ext-enable xdebug sockets

RUN a2enmod rewrite && a2enmod ssl && a2enmod socache_shmcb && a2ensite default-ssl.conf && \
    a2enmod auth_basic auth_digest authn_file authn_dbd 


# directory for CA files
RUN mkdir /etc/ssl_clientauth_cas && chown root.www-data /etc/ssl_clientauth_cas/  && chmod 750 /etc/ssl_clientauth_cas/

COPY ./certs/localhost.crt /etc/ssl/certs/ServerCert.crt
COPY ./certs/LocalhostKey.pem /etc/ssl/private/ServerKey.pem

COPY ./credstore/* /etc/apache2/credstore/
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./html/ /var/www/html/
COPY ./sites/ /etc/apache2/sites-available/
