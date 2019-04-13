require 'test_helper'

class AdminHubControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_hub_index_url
    assert_response :success
  end

end
