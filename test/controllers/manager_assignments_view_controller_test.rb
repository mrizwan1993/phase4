require 'test_helper'

class ManagerAssignmentsViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_assignments_view_index_url
    assert_response :success
  end

end
