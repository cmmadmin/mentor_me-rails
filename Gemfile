source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'haml'
gem 'haml-rails'

# JSON Parsing and Templating
gem 'rabl'
gem 'oj'
gem 'multi_json'

# Authentication and Authorization
gem 'devise', '2.1.0'
gem 'rack-cors', :require => 'rack/cors'

# Controller helper
gem 'inherited_resources'
gem 'simple_form'

#gem "therubyracer"
#gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"

gem "enumerize"
gem 'rails_admin'

# DB Gems
gem 'foreigner'

gem 'pg'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :development do
  # Use unicorn as the app server
  gem 'unicorn'
  # Unicorn rack handler for rails s
  gem 'hooves'

  gem 'railroady'

  gem "letter_opener"
end

group :development, :test do
  gem 'mysql2'

  gem 'pry'

  gem 'rspec-rails'

  gem 'factory_girl', '~> 4.1.0'
  gem 'factory_girl_rails', '~> 4.1.0'
end
