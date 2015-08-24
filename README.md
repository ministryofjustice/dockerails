# Dockerails

This is a sample Rails app using MOJ DS standard Docker deployment setup.
	
Eventually this will become a demonstration how all Rails apps should be setup:

* standard Docker setup
* Docker compose for local run / development
* SaltStack for provisioning
* AWS CloudFormation for deployment

# Running

Once you have docker set up so that it runs locally (outside the scope of
this readme) and docker-compose installed (probably via
[docker-toolbox](https://www.docker.com/toolbox)) then running is a matter of
doing:

```
# To create the initial db. Only needs to be done once
docker-compose run --rm web bundle exec rake db:setup
docker-compose up
```

# Installing a new Gem (aka running `bundle install`)

If you want to add a new gem the workflow is a little bit more complex than we
are used to, but it is not terrible.

First off, add/change the Gemfile as normal using your local editor then run
this command:

```
docker-compose run --rm=true -e BUNDLE_FROZEN=0 --entrypoint=bundle web
```

This says run `bundle install` in the image as the web service but a new
container. The `-e BUNDLE_FROZEN=0` sets an environment variable so that
bundler won't complain about the gem missing from the Gemfile.lock.

You will also need to re-build the image else it won't start next time you try
to run it (because we've:

```
docker-compose build web
```

Once you've done this you will then need to restart the running docker-compose
services (hit ^C then re-run `docker-compose up`).
