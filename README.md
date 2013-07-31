# Mentor Me Rails Backend

This project consists of a simple Rails API backend and an Admin interface to manage all the data for our Mentor Me Mobile App.

I have included the default RAILS_README if you want to read more about rails.

## Installation

First of all make sure you have [Ruby](http://ruby-lang.org) installed.

As with most Rails applications these days the application dependencies are managed by [Bundler](http://bundler.io/). You can install Bundler by running `gem install bundler`

To have Bundler download all the required gems(dependencies) just run `bundle install`

## DB Setup

The project currently uses PostgresSQL though it can also be configured to use MySQL or Sqlite as we don't use any PostgreSQL specific features.

Make a copy of `config/database.yml.example` to `config/database.yml` and set the necessary values to connect to your DB.

You can bootstrap and setup your DB by executing `rake db:setup`. Rake is a ruby build program that is used for a lot of tasks.

## Running

Once everything is installed and your db is setup you can run the application by running `rails server` in your project root directory. This will startup a Unicorn application server to serve your rails application. By default it starts up at `localhost:3000`.

## Admin Page

You can access the admin page by going to `localhost:3000/admin`.