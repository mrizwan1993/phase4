require 'test_helper'

class EmployeeActiveStoresViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_active_stores_view_index_url
    assert_response :success
  end

end
