
FROM ubuntu:latest
MAINTAINER Zhao Chunyou <zhaochunyou@gmail.com>

RUN apt-get update
RUN apt-get install -y git wget build-essential python python-setuptools python-pip python-dev libffi-dev nginx

RUN pip install gunicorn supervisor
RUN pip install alerta-server==4.8.3

RUN wget -q -O - https://github.com/alerta/angular-alerta-webui/tarball/master | tar zxf -
RUN mv alerta-angular-alerta-webui-*/app /app

RUN wget -q -O - https://github.com/alerta/alerta-contrib/tarball/master | tar zxf -
RUN mv alerta-alerta-contrib-* alerta-contrib
RUN cd alerta-contrib/plugins/amqp && python setup.py install
RUN cd alerta-contrib/integrations/mailer && python setup.py install

ENV ALERTA_SVR_CONF_FILE /alertad.conf
ENV ALERTA_CONF_FILE /alerta.conf
ENV BASE_URL /api
ENV AUTH_REQUIRED False
ENV ADMIN_USERS not-set
ENV CUSTOMER_VIEWS False
ENV PROVIDER basic
ENV CLIENT_ID not-set
ENV CLIENT_SECRET not-set
ENV ALLOWED_EMAIL_DOMAIN *
ENV ALLOWED_GITHUB_ORGS *
ENV GITLAB_URL not-set
ENV ALLOWED_GITLAB_GROUPS *
ENV MONGO_URI not-set
ENV EMAIL_TYPE html

ADD config.js.sh /config.js.sh
ADD alertad.conf.sh /alertad.conf.sh
ADD alerta.conf.sh /alerta.conf.sh
ADD nginx.conf /nginx.conf
ADD supervisord.conf /etc/supervisord.conf

EXPOSE 80
CMD /config.js.sh && /alertad.conf.sh && /alerta.conf.sh && supervisord -n
