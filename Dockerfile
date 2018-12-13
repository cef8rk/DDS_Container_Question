FROM php:7.1-apache
RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev
COPY server.crt /etc/apache2/ssl/server.crt
COPY server.key /etc/apache2/ssl/server.key
COPY localhost.conf /etc/apache2/sites-enabled/localhost.conf
COPY fqdn.conf /etc/apache2/conf-available/fqdn.conf
COPY ./index.html /var/www/html/
RUN mkdir /var/www/html/admin
COPY ./placeholder.html /var/www/html/admin/index.html
COPY ./script_runner.sh /var/www/html/
RUN a2enmod rewrite
RUN a2enmod ssl
RUN service apache2 restart

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:theempiredidnothingwrong' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
