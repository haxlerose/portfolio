ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

# Include Devise helpers for integration/controller tests
class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end

# Stub Geocoder in tests to avoid external calls
if defined?(Geocoder)
  # Use Geocoder's built-in test adapter for both address and IP lookups
  Geocoder.configure(lookup: :test, ip_lookup: :test)

  # Specific stubs used in fixtures/tests
  Geocoder::Lookup::Test.add_stub(
    "127.0.0.1",
    [ { 'city' => 'San Francisco', 'region' => 'CA', 'country' => 'US' } ]
  )

  Geocoder::Lookup::Test.add_stub(
    "192.0.2.1",
    [ { 'city' => 'London', 'region' => 'England', 'country' => 'GB' } ]
  )

  # Fallback for any other IPs encountered during tests
  Geocoder::Lookup::Test.set_default_stub(
    [ { 'city' => nil, 'region' => nil, 'country' => nil } ]
  )
end
