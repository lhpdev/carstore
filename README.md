# README

This is a simple Ruby on Rails application for searching vehicles using pre defined filters.

It is using postgres for database

* Ruby version
  - ruby '2.5.3'


* System dependencies
  - Docker


* Configuration
  - Run the command ```docker-compose build``` to build docker environment
  - To run the project run the command: ```docker-compose up```


* Database creation
  - To create the database run the command: ```docker-compose run --rm web rails db:create```

* Database initialization
  - To migrate the database run the command: ```docker-compose run --rm web rails db:migrate```
  - To seed the database run the command: ```docker-compose run --rm web rails db:seed```

* How to run the test suite
  - To run the rspec suite, run the command ```docker-compose run --rm web rspec spec/```


* Considerations:
  I only imported files from vehicles_list_2 because the other one did not have a column 'body', so it would be a very painful process to set what size each car was, based on its make/model.
