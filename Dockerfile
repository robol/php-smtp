FROM php:7.2-apache

RUN apt-get -qq update && \ 
	apt-get -y install msmtp msmtp-mta && \
	rm -rf /var/lib/apt/lists/* && \
	echo "sendmail_path=sendmail -i -t" > /usr/local/etc/php/conf.d/php-sendmail.ini

COPY msmtprc /etc/msmtprc.in
COPY docker-php-configure-smtp-entrypoint /usr/local/bin/docker-php-configure-smtp-entrypoint

CMD [ "docker-php-configure-smtp-entrypoint" ]

