require 'test_helper'

class ManagerEmployeesViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_employees_view_index_url
    assert_response :success
  end

end
