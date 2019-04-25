require 'test_helper'

class AdminManagerViewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_manager_views_index_url
    assert_response :success
  end

end
