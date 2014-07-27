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

gem 'andand'

gem 'jquery-rails'
gem 'haml'
gem 'haml-rails'

# JSON Parsing and Templating
gem 'rabl'
gem 'oj'
gem 'multi_json'

# Authentication and Authorization
gem 'devise', '2.2.8'
gem 'rack-cors', :require => 'rack/cors'

# File Processing
gem 'carrierwave'  
gem "mini_magick"
gem "fog"

# Controller helper
gem 'inherited_resources'
gem 'simple_form'

#gem "therubyracer"
#gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS

# Model Addons
gem "enumerize"
gem "strip_attributes", "~> 1.2"
gem 'acts_as_list'

# DB Gems
gem 'pg'
gem 'foreigner'

# Bootstrap / Admin
gem "twitter-bootstrap-rails"
gem "safe_yaml", "0.6.3"
gem 'rails_admin', '~> 0.4.9'
gem 'rails_admin_nestable'
gem "rails_admin_import", :git => "git://github.com/stephskardal/rails_admin_import.git"

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

  # Speed and testing Tools (not needed on testing/integration server)
  gem 'guard'
  gem 'rb-fsevent'
  gem 'zeus'
  gem 'guard-rspec'

end

group :development, :test do

  # Debugger and REPL
  gem 'pry'
  gem 'pry-stack_explorer'
  gem 'pry-debugger'

  gem 'rspec'
  gem 'rspec-rails', ">= 2.0"
  gem 'shoulda-matchers'
  gem 'factory_girl', ">= 4.2.0"
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'poltergeist'
  gem 'rr'
  gem 'ffaker'
  gem 'database_cleaner'

  gem 'ruby_gntp'
  gem 'fuubar'
end
