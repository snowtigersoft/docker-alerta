#!/bin/bash

cat >/app/config.js << EOF
'use strict';

angular.module('config', [])
  .constant('config', {
    'endpoint'    : "/api",
    'provider'    : "$PROVIDER",
    'client_id'   : "$CLIENT_ID",
    'gitlab_url'  : "$GITLAB_URL",

    'colors'      : {
      'severity': {
        'critical'     : '#e4b9b9',
        'major'        : '#f2dede',
        'minor'        : '#f7ecb5',
        'warning'      : '#fcf8e3',
        'indeterminate': '#silver',
        'cleared'      : '#c1e2b3',
        'normal'       : '#c1e2b3',
        'ok'           : '#c1e2b3',
        'informational': '#c1e2b3',
        'debug'        : '#afd9ee',
        'security'     : '#d9edf7',
        'unknown'      : '#silver'
      },
      'highlight': 'lightgray'
    }
  });
EOF
