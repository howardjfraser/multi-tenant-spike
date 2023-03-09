ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Add more helper methods to be used by all tests here...

  # NOTE: by default Current.user is set for all tests. Better to be explicit?
  def setup
    create(:company_user, company: create(:company, name: "first"))
    create(:company_user, company: create(:company, name: "second"))

    Tenant.switch!(Company.find_by(name: "first"))
  end

  def teardown
    Current.reset
  end
end
