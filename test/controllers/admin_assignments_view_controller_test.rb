require 'test_helper'

class AdminAssignmentsViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_assignments_view_index_url
    assert_response :success
  end

end
