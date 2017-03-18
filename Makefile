BIN := bin
RAKE := rake
DOCKER := docker-compose
BE := bundle exec
RAILS := $(BE) rails
RSPEC := $(BE) rspec
RUBOCOP := $(BE) rubocop
PG_DUMP := pg_dump

.PHONY: run
run:
	heroku local:start

.PHONY: depends
depends:
	bundle update

.PHONY: clean
clean:
	bundle install

.PHONY: db-init
db-init:
		$(RAKE) db:create RAILS_ENV=development
		$(RAKE) db:migrate RAILS_ENV=development
