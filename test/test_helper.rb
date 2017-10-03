require 'simplecov'
SimpleCov.start

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'capybara/rails'
require 'capybara-screenshot/minitest'
require 'database_cleaner'
require 'shoulda/matchers'

Capybara.default_driver = :webkit
Capybara.javascript_driver = :webkit

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean_with :truncation

class ActiveSupport::TestCase
  setup do
    DatabaseCleaner.clean
  end
end
