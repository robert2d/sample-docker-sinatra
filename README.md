# Simple-Sinatra-App
You can see everything in the DockerFile
This app uses [sinatra](http://www.sinatrarb.com/intro.html) a super lightweight ruby web framework. Perfect for simple apps and API's

## How to
first make sure you have docker [installed](http://docs.docker.com/mac/step_one/)

start the default VM
`docker-machine start default`

You may need to put env vars into shell
`eval "$(docker-machine env default)"`

build this project as a docker container
`docker build -t crichq/sample .`
wait for a while as the Dockerfile gets run

to run the container and use port forwarding
`docker run -p 8080:8080 crichq/sample`
access `localhost:8080` to see the container

For normal day to day dev
`bundle exec foreman start`
`bundle exec rack up -p 8080` any port you want

## Deploying into the real world
this project would have a spec folder with tests etc.. CircleCI would run those then build the docker container and publish it into ECS on AWS. It would then trigger a deployment on Opsworks which would pull the container and run a rolling deployment. But there are any other ways of doing this as well
