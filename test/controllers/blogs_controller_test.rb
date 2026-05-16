require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blogs_url
    assert_response :success
  end

  test "navbar section links point back to home page anchors" do
    get blogs_url
    assert_response :success

    assert_select "a[href='#{root_path(anchor: "about-me")}']", text: "About"
    assert_select "a[href='#{root_path(anchor: "skills")}']", text: "Skills"
    assert_select "a[href='#{root_path(anchor: "projects")}']", text: "Projects"
    assert_select "a[href='#{root_path(anchor: "contact")}']", text: "Contact"
  end

  test "should return 404 for invalid slug" do
    get blog_post_url(slug: "nonexistent-post")
    assert_response :not_found
  end

  test "should reject directory traversal attempts" do
    get blog_post_url(slug: "../../../etc/passwd")
    assert_response :not_found
  end

  test "should reject slugs with uppercase" do
    get blog_post_url(slug: "InvalidSlug")
    assert_response :not_found
  end
end
