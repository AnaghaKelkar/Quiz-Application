# README

Find detailed report of application in public folder.

Things to make application run successfully:

* Ruby version

  2.3.3

* Rails version
    
  5.1.5

* Github version
  
  1.9.4

* sqlite version

  3.8.7.2

* Clone project

  git clone git@github.com:AnaghaKelkar/quiz_app.git

  ------------------------or------------------------ 
  
  download zip

* Go to folder

  cd quiz_app (in case of clone)

  cd quiz_app-master (in case of downloading)

* Install gemset

  bundle install

* Database creation
  
  rake db:create

* Database initialization
  
  rake db:migrate

* Setup 
  
  rake initial:setup

* Start Server

  rails server

* Run application in browser
  
  localhost:3000

* Application testing - Rspec

  bundle exec rspec spec/features/users/*

  bundle exec rspec spec/features/visitors/*

  bundle exec rspec spec/features/quiz/*
