require 'test_helper'

class ManagerHubControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_hub_index_url
    assert_response :success
  end

end
