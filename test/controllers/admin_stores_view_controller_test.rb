require 'test_helper'

class AdminStoresViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_stores_view_index_url
    assert_response :success
  end

end
