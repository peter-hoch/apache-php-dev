FROM php:8.0.20-apache


RUN apt-get update && apt-get install -y net-tools vim curl iputils-ping wget curl iproute2 ssl-cert python3.9 pip && \
    docker-php-ext-install mysqli sockets

RUN pecl install xdebug-3.4.2
RUN docker-php-ext-enable xdebug sockets

RUN a2enmod rewrite && a2enmod ssl && a2enmod socache_shmcb && a2ensite default-ssl.conf && \
    a2enmod auth_basic auth_digest authn_file authn_dbd 


# directory for CA files
RUN mkdir /etc/ssl_clientauth_cas && chown root.www-data /etc/ssl_clientauth_cas/  && chmod 750 /etc/ssl_clientauth_cas/

COPY ./certs/localhost.crt /etc/ssl/certs/ServerCert.crt
COPY ./certs/LocalhostKey.pem /etc/ssl/private/ServerKey.pem

COPY ./credstore/* /etc/apache2/credstore/
COPY ./html/ /var/www/html/
COPY ./sites/ /etc/apache2/sites-available/

RUN mkdir /etc/apache2/apache-config && \
    mv /etc/apache2/apache2.conf /etc/apache2/apache-config && \
    ln -s /etc/apache2/apache-config/apache2.conf /etc/apache2/apache2.conf

COPY ./php.ini /usr/local/etc/php/php-config/php.ini
    
RUN rm -f /usr/local/etc/php/php.ini && \
    ln -s /usr/local/etc/php/php-config/php.ini /usr/local/etc/php/php.ini


    