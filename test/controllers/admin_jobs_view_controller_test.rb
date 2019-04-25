require 'test_helper'

class AdminJobsViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_jobs_view_index_url
    assert_response :success
  end

end
