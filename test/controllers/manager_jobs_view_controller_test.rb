require 'test_helper'

class ManagerJobsViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_jobs_view_index_url
    assert_response :success
  end

end
