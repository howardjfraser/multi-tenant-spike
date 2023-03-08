require "test_helper"
require "support/with_current_company"

class ProjectTest < ActiveSupport::TestCase
  include ::WithCurrentCompany

  setup do
    @project = projects(:one)
  end

  test "valid fixture" do
    assert @project.valid?
  end

  test "create" do
    p = Project.create! name: "project"
    assert_equal "project", p.reload.name
  end
end
