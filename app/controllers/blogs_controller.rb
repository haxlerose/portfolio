class BlogsController < ApplicationController
  def index
  end

  def show
    blog_post = BlogPost.find(params[:slug])

    if blog_post
      render "blogs/posts/#{blog_post.slug}"
    else
      raise ActionController::RoutingError, "Not Found"
    end
  end
end
