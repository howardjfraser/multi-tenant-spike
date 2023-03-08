class ProjectsController < ApplicationController
  before_action :stub_company

  def index
    @projects = Project.all
  end

  private

  # TODO: this would come from logging in...
  def stub_company
    Current.company = Company.first
    Current.user = Company.first.users.first
  end
end
