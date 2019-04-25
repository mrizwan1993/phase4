require 'test_helper'

class ManagerShiftsViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_shifts_view_index_url
    assert_response :success
  end

end
