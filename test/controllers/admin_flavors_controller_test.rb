require 'test_helper'

class AdminFlavorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_flavors_index_url
    assert_response :success
  end

end
