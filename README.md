# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

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

  ................User Login related specs...................
  bundle exec rspec spec/features/users/sign_in_spec.rb
  bundle exec rspec spec/features/users/sign_out_spec.rb
  bundle exec rspec spec/features/users/user_delete_spec.rb
  bundle exec rspec spec/features/users/user_edit_spec.rb
  bundle exec rspec spec/features/users/user_index_spec.rb
  .....................After login pages......................
  bundle exec rspec spec/features/visitors/about_page_spec.rb
  bundle exec rspec spec/features/visitors/home_page_spec.rb
  bundle exec rspec spec/features/visitors/navigation_spec.rb
  bundle exec rspec spec/features/visitors/sign_up_spec.rb
  .......................Setup test specs.....................
  bundle exec rspec spec/features/quiz/quiz_spec.rb