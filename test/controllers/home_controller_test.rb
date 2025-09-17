require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "renders index successfully" do
    get root_url
    assert_response :success
  end
end

