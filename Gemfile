source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
 gem 'bcrypt'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use PostgreSQL as the database for Active Record in production
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use sqlite3 as the database for Active Record in development
group :development do
  gem 'sqlite3'
  gem 'pry-rails'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda'
  gem 'factory_girl_rails', '~> 4.0'
end

# Use Devise for user authentication with Warden
 gem 'devise'

#Adds CSS/SCSS styling
 gem 'bootstrap-sass'

#Figaro handles sensitive data with environment variables
 gem 'figaro', '1.0'

#Allows pushing secrets.yml to Heroku with:
#rake heroku:secrets RAILS_ENV=production
#gem 'heroku_secrets', github:
#'alexpeattie/heroku_secrets'

#Faker handles random data seed creation
 gem 'faker'

#Punit handles user roles and authorization
 gem 'pundit'
