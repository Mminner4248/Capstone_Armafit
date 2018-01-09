# README

## About the Project

# Armafit 

A Ruby on Rails Crossfit scheduling app that allows coaches to design and schedule workouts and users to sign up and save workouts using a mySQL database.

## Major Gems used:

* gem 'bootstrap' 
* gem 'fullcalendar-rails' - Calendar funcationality. Read more: [here](https://github.com/bokmann/fullcalendar-rails)
* gem 'gon' - allows you to use rails variables in JS files. Read more: [here](https://github.com/gazay/gon)
* gem 'jquery-rails' - Adds Jquery for bootstrap support
* gem 'jbuilder', '~> 2.5' - Build JSON APIs with ease. Read more: [here](https://github.com/rails/jbuilder)  

## Setup

If you would like to run this on your local machine, these installation tips are a helpful quick start. 

## Install

* [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/)
* [Install Rails](https://github.com/tbsvttr/install-ruby-and-rails)
* [Install MySQL](https://www.mysql.com/downloads/) or install with homebrew

```
brew update
brew install mysql
```
After mySQL installs, run the following command:
```
mysql_secure_installation
```
You will be prompted to answer a series of questions (recommended answers: n, y, y, y, y)

**NOTE:** If you recieve the following error...
```
Error: Can’t connect to local MySQL server through socket ‘/tmp/mysql.sock’ (2)
```
Stop the mySQL Sever and restart it using the following commands:
STOP
```
mysqld stop
```
START
```
mysql.server start
```
## Setup Database
In consle, run the following code to setup the database
```
mysql -uroot -p
```
Enter the password you created when you setup mysql

Now, you will be inside the mySQL CLI. You should see something similar to the following:
```
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 5
Server version: 5.7.20 Homebrew

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
```
Create the Development DB
```
CREATE DATABASE Armafit_development;
```
Create the Testing DB
```
CREATE DATABASE Armafit_testing;
```
Grant privileges to development DB by setting a user and a password. User: Armafit_user PW: ruby
```
GRANT ALL PRIVILEGES ON Armafit_development.* TO 'Armafit_user'@'localhost' IDENTIFIED BY 'ruby';
```
Grant privileges to testing DB by setting a user and a password. User: Armafit_user PW: ruby
```
GRANT ALL PRIVILEGES ON Armafit_testing.* TO 'Armafit_user'@'localhost' IDENTIFIED BY 'ruby';
```
Exit the mySQL CLI
```
exit
```

## Initialize App

run commands in console
``` 
bundle install - Installs the various gems located in the GemFile
rails db:migrate - Adds all new database migrations to user database.
rails db:seed - Adds data to database. 
rails s - Starts the rails server. 
```
Visit localhost:3000 in web browser for Rails page


## Meet the Dev Team
- [Matt Minner](https://github.com/Mminner4248)

