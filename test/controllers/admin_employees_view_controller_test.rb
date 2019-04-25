require 'test_helper'

class AdminEmployeesViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_employees_view_index_url
    assert_response :success
  end

end
