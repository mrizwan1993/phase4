require 'test_helper'

class AdminShiftJobsViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_shift_jobs_view_index_url
    assert_response :success
  end

end
