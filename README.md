# README

## Requirements
Ruby: 3.0.0
PostgreSQL: 12+

##Ruby version

```bash
rbenv install 3.0.0
# Verify expected ruby version is installed
ruby --version
```

## Set up project
1. Install and configure PostgreSQL database
2. Install dependencies by running `bundle install`
3. Run `rails db:setup && rails db:migrate` to initilize databases
4. Add OMDB_API_KEY to .env.* files

## Running tests
Run `bundle exec rspec`

## Running swagger
Run `bundle exec rails rswag`

## Runnning server
Run `rails s`

## Running api-docs
1. Run rails server: `rails s`
2. Go to http://localhost:3000/api-docs/
