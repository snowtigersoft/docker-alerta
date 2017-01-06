
alerta
======

Alerta monitoring tool for consolidated view of alerts

Installation
------------

Build the image:

    $ docker build -t="alerta:latest" .

Then running the alerta container:

    $ docker run --name alerta - -p <port>:80 alerta

The API endpoint is at:

    http://<docker>:<port>/api

Browse to the alerta console at:

    http://<docker>:<port>/

To check running processes and tail the application and web server logs:

    $ docker top alerta
    $ docker logs -f alerta

Configuration
-------------
Support these env vars:
-e ADMIN_USERS The admin user email list
-e AUTH_REQUIRED True/False  Must login or not
-e ALLOWED_EMAIL_DOMAINS register user domains
-e CORS_ORIGINS http://127.0.0.1,http://localhost
-e MONGO_URI mongo connection string 
-e AMQP_URL amqp url 
-e AMQP_TOPIC amqp topic 
-e DASHBOARD_URL the alerta dashboard url, use in mailer 
-e SMTP_HOST smtp host, use in mailer 
-e SMTP_PORT smtp port, use in mailer 
-e SMTP_PASSWORD smtp password, use in mailer 
-e ALERTA_MAIL_FROM from email address, use in mailer 
-e ALERTA_MAIL_TO to email address, use in mailer 
-e ALERTA_ENDPOINT the alerta server endpoint, use in mailer 
-e ALERTA_API_KEY the alerta api key, use in mailer 
-e API_RULES_URL the rule checker emails list url