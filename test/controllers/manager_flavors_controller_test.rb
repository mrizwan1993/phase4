require 'test_helper'

class ManagerFlavorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_flavors_index_url
    assert_response :success
  end

end
