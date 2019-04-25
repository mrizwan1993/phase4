require 'test_helper'

class ManagerStoreFlavorsViewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_store_flavors_view_index_url
    assert_response :success
  end

end
