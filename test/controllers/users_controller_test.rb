require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get admin_panel" do
    get users_admin_panel_url
    assert_response :success
  end

end
