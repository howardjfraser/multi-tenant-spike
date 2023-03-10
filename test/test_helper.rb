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
    @first_co = create(:company, name: "first")
    @first_user = create(:user)
    create(:company_user, company: @first_co, user: @first_user)

    @second_co = create(:company, name: "second")
    @second_user = create(:user)
    create(:company_user, company: @second_co, user: @second_user)

    Tenant.switch!(Company.find_by(name: "first"))
  end

  def teardown
    Current.reset
  end
end
