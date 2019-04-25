require 'test_helper'

class ManagerShiftJobsViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_shift_jobs_view_index_url
    assert_response :success
  end

end
