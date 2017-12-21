Ruby version: ruby-2.4.2

## Configuration
- Install required gems
```sh
$ gem install bundler
```
```sh
$ bundle install
```
- Create required databases
```sh
$ psql
```
```
create database ex_app;
create database ex_app_test;
```
- To create required table run
```sh
$ ruby db/run.rb
```
## To run tests use
```sh
$ rspec
```
