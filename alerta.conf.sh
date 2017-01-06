#!/bin/bash

cat >/alerta.conf << EOF
[alerta-mailer]
key = $ALERTA_API_KEY
endpoint = $ALERTA_ENDPOINT
mail_to = $ALERTA_MAIL_TO
mail_from = $ALERTA_MAIL_FROM
amqp_url = $AMQP_URL
dashboard_url = $DASHBOARD_URL
smtp_password = $SMTP_PASSWORD
debug = False
skip_mta = False
email_type = $EMAIL_TYPE
smtp_host = $SMTP_HOST
smtp_post = $SMTP_PORT
api_rules_url = $API_RULES_URL
EOF
