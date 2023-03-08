class ProjectsController < ApplicationController
  before_action :stub_company

  def index
    @projects = Project.all
  end

  private

  # TODO: this would come from logging in...
  def stub_company
    Current.user = User.all.sample
    Current.company = Current.user.companies.first
  end
end
