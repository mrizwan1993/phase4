require 'test_helper'

class EmployeeHubControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_hub_index_url
    assert_response :success
  end

end
