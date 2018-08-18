# frozen_string_literal: true

require "bundler/setup"
require "jsonapi/swagger/blocks/generator"
require "active_record/railtie"
require "jsonapi-resources"
require "aruba/rspec"
require "simplecov"

RSpec.configure do |config|
  SimpleCov.start
  config.include Aruba::Api
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
