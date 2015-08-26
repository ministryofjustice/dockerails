#!/usr/bin/env bash

case ${DOCKER_STATE} in
migrate)
    echo "running migrate"
    bundle exec rake db:migrate
    ;;
esac

exec bundle exec unicorn -p $UNICORN_PORT
