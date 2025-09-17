require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "redirects to sign in when unauthenticated" do
    get admin_url
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "renders index when authenticated" do
    user = users(:one)
    sign_in user

    get admin_url
    assert_response :success
  end
end
