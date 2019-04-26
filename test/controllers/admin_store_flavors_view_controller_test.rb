require 'test_helper'

class AdminStoreFlavorsViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_store_flavors_view_index_url
    assert_response :success
  end

end
