require "test_helper"

class RobotsControllerTest < ActionDispatch::IntegrationTest
  test "should include sitemap location" do
    get "/robots.txt"

    assert_response :success
    assert_equal "text/plain", response.media_type
    assert_includes response.body, "User-agent: *"
    assert_includes response.body, "Sitemap: http://www.example.com/sitemap.xml"
  end
end
