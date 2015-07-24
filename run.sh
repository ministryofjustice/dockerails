#!/usr/bin/env bash

case ${DOCKER_STATE} in
migrate)
    echo "running migrate"
    bundle exec rake db:migrate
    ;;
esac

bundle exec unicorn -p $UNICORN_PORT
