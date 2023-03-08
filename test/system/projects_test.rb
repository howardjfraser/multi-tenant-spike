require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  test "index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end
end
