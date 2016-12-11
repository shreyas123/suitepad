# README

A simple application which updates the page every 10 mins with a quote and a different background image. [![Build Status](https://travis-ci.org/shreyas123/suitepad.svg?branch=master)](https://travis-ci.org/shreyas123/suitepad)

### Ruby version
`2.3.1` Anything from 2.3.0 and above

### Database creation
`rake db:create`
`rake db:migrate`

### Database initialization
`rake db:seed`
This will load the csv with almost 75000 quotes onto your database.

### How to run the test suite
Please initalize the test database with `RAILS_ENV=test rake db:create db:migrate` before running the test suite. 
`bundle exec rspec .`

# TODOs
 - Add Image transtions 
 - Add features specs using capybara or cuccumber. (Sorry that is too much to do like adding gems and all)
 - Load the images before hand and create a template of a small HTML within JS and load it on page load
