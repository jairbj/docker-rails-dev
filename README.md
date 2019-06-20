### RubyOnRails development environment

# Important
- You should run the container with the **-it** flag and **/bin/bash** command as it doesn't have any initial command.
- When you run the **rails s** command you should bind it to **0.0.0.0**

# Features

- It was made to be a reusable container, so creating and removing it each time will make you spend more time in development as you will need to reinstall all your gems. I suggest you set a **--name** to your container and reuse it.
- It uses RVM to manage ruby version, so it's possible to install any ruby version you want.
- It comes with rails pre installed but you can use any version of rails inside your projects.
- It's based on ubuntu image.

#  Tags
|Tag|Pre installed rails version|Ruby version|Ubuntu base image|
| ------------ | ------------ | ------------ | ------------ |
|[latest](https://github.com/jairbj/docker-rails-dev/blob/master/Dockerfile/latest/Dockerfile "latest")|6.0.0.rc1|2.6.3|bionic|
|[6.0.0.rc1](https://github.com/jairbj/docker-rails-dev/blob/master/Dockerfile/6.0.0.rc1/Dockerfile "6.0.0.rc1")|6.0.0.rc1|2.6.3|bionic|
|[5.2.3](https://github.com/jairbj/docker-rails-dev/blob/master/Dockerfile/5.2.3/Dockerfile "5.2.3")|5.2.3|2.6.3|bionic|

# Usage
##### docker run
```
docker run -it --name rails-dev -v "$(PWD):/usr/src/app" -p 3000:3000 jairbj/rails-dev /bin/bash
bundle install
rails s -b 0.0.0.0
```

##### docker-compose
###### docker-compose.yml
```yaml
version: "3.7"
services:
  web:
    image: "jairbj/rails-dev:latest"
    container_name: "web"
    ports:
      - "3000:3000"
    volumes:
      - "./:/usr/src/app"
    command: "/bin/bash"
    tty: true
```
###### commands
###### start docker-compose stack in background
```
docker-compose up -d
```
###### attach to container for running commands
```
docker-compose exec web /bin/bash
```