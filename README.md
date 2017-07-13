# simple app to use RabbitMQ and Ruby on Rails

A barebones Rails app, which can easily be deployed to Heroku.

## Running Locally

```sh
$ git clone https://github.com/justindenick/rbmq.git
$ cd rbmq
$ bundle install
$ bundle exec rake db:create db:migrate
$ heroku local
```
or

```sh
$ make depends db-init run
```

Your app should now be running on [localhost:5000](http://localhost:5000/).
