BIN := bin
RAKE := rake
DOCKER := docker-compose
BE := bundle exec
RAILS := $(BE) rails
RSPEC := $(BE) rspec
RUBOCOP := $(BE) rubocop
PG_DUMP := pg_dump
RBMQ := /usr/local/bin/rabbitmq-server
.PHONY: run
run: depends db-init
	# need to start this a better way
	# ought to have pids and stuff but psgrep works for now
	psgrep rabbitmq || $(RBMQ) -detached
	heroku local:start

.PHONY: check
check:
		bundle check
		bundle update

.PHONY: depends
depends:
	bundle install

.PHONY: clean
clean:
	bundle clean --force

.PHONY: db-init
db-init:
		$(RAKE) db:create RAILS_ENV=development
		$(RAKE) db:migrate RAILS_ENV=development

.PHONY: install
install: depends
	brew list rabbitmq &>/dev/null || brew install rabbitmq
	brew list psgrep &>/dev/null || brew install psgrep
