require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    FactoryBot.create_list(:project, 3)
    get projects_url
    assert_select "#count", "3 projects found"
  end
end
