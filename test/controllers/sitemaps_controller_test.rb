require "test_helper"

class SitemapsControllerTest < ActionDispatch::IntegrationTest
  test "should get sitemap xml" do
    get "/sitemap.xml"

    assert_response :success
    assert_equal "application/xml", response.media_type
    assert_includes response.body, root_url
    assert_includes response.body, blogs_url
  end

  test "includes blog post templates automatically" do
    get "/sitemap.xml"

    assert_response :success
    BlogPost.all.each do |post|
      assert_includes response.body, blog_post_url(slug: post.slug)
    end
  end
end
