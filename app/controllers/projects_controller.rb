class ProjectsController < ApplicationController
  before_action :stub_company

  def index
    @projects = Project.all
  end

  private

  # TODO: this would happen as part of logging in / switching company
  def stub_company
    Current.user = User.unscoped.all.sample
    Current.company = Current.user.companies.first
  end
end
