#!/bin/bash

encrypt="$(cat ci/.rsa/id_rsa_encrypt)"

config="$(jq -n '{
  "count": 1,
  "git": {
      "searchPaths": "dev",
      "label": "master",
      "uri": "https://github.com/BrunoBeraudPW/config-server-configs",
      "periodic":"true"
  },
  "encrypt": {
      "key": "'"${encrypt}"'"
  }
}
')"

cf create-service p-config-server trial config-server -c "$(echo ${config} | jq -c .)"