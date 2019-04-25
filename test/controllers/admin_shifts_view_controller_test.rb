require 'test_helper'

class AdminShiftsViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_shifts_view_index_url
    assert_response :success
  end

end
