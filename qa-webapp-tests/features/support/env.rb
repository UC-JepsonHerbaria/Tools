require 'rubygems'
require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara-screenshot/cucumber'

require File.expand_path('../custom_config', __FILE__)
include CustomConfig
Capybara.default_driver = :selenium
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_wait_time = 10

# For headless testing, uncomment the line below:
# Capybara.javascript_driver = :webkit

### To override default settings in the capybara-screenshot gem: ###
Capybara.save_and_open_page_path = "tmp/capybara"
# Keep only the screenshots generated from the last failing test suite
Capybara::Screenshot.prune_strategy = :keep_last_run
# Uncomment below if you want to keep up to the number of screenshots specified in the hash
# Capybara::Screenshot.prune_strategy = { keep: 20 }

World(Capybara)