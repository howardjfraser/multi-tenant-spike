class ApplicationController < ActionController::Base
  private

  # NOTE: this would happen as part of logging in / switching company
  def stub_company
    Current.user = User.unscoped.all.sample
    Current.company = Current.user.companies.first
  end
end
