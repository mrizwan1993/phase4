require 'test_helper'

class ManagerStoresViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_stores_view_index_url
    assert_response :success
  end

end
