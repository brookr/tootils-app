# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem "thoughtbot-factory_girl", 
    :lib => "factory_girl", 
    :source => "http://gems.github.com"
  config.gem 'twitter',
    :lib => 'twitter',
    :version => '0.6.13'
  config.gem 'brookr-tootils',
    :lib => 'tootils',
    :version => '0.1.1'
  
  config.time_zone = 'UTC'
end

AuthConfig = YAML.load(File.read(Rails.root + 'config' + 'authentication.yml'))