FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y curl \
    && apt-get install -y nginx \
    && apt-get install -y php7.4-fpm php-mysql \
    && rm -rf /var/lib/apt/list/* \
    && apt-get purge --autoremove \
    && apt-get clean


COPY web1.conf /etc/nginx/sites-available/

RUN rm /etc/nginx/conf.d/* \
    rm /etc/nginx/sites-enabled/default \
    rm -rf /var/www/* \
    && ln -s /etc/nginx/sites-available/web1.conf /etc/nginx/sites-enabled/

RUN cd /var/www \
    && curl -LO https://wordpress.org/latest.tar.gz \
    && tar -zxvf latest.tar.gz  \
    && chown -R www-data:www-data /var/www/wordpress \
    && chmod -R 775 /var/www/wordpress/* \
    && rm latest.tar.gz 
RUN sed -i 's/database_name_here/wordpress/g' /var/www/wordpress/wp-config-sample.php \
    && sed -i 's/username_here/kiennt1/g' /var/www/wordpress/wp-config-sample.php \
    && sed -i 's/password_here/caoml@2020/g' /var/www/wordpress/wp-config-sample.php
    
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh


EXPOSE 80

WORKDIR /home
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]




