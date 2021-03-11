# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require 'support/simplecov'

require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
require "rspec/json_expectations"
require 'devise/jwt/test_helpers'
require 'money-rails/test_helpers'
require "cancan/matchers"
require 'carrierwave/test/matchers'
#require "action_cable/testing/rspec"

require 'support/database_cleaner'
require 'support/factory_bot'
require 'support/file_spec_helper'
require 'support/fuubar'
require 'support/shoulda'
require 'support/helpers/headers'
require 'support/carrier_wave'
require 'support/action_cable_helper'

require 'spec_helper'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.include Helpers::Headers

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
