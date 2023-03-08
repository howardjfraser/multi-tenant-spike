require "test_helper"
require "support/with_tenant"

class ProjectTest < ActiveSupport::TestCase
  include ::WithTenant

  def setup
    super # initialize Current otherwise next line will fail
    @project = FactoryBot.create(:project)
  end

  test "valid" do
    assert @project.valid?
  end

  test "create" do
    p = Project.create! name: "project"
    assert_equal "project", p.reload.name
  end
end
