class BlogsController < ApplicationController
  def index
  end

  def show
    slug = params[:slug]
    # Only allow lowercase alphanumeric and hyphens (prevents directory traversal)
    if slug =~ /\A[a-z0-9\-]+\z/ && template_exists?("blogs/posts/#{slug}")
      render "blogs/posts/#{slug}"
    else
      raise ActionController::RoutingError, "Not Found"
    end
  end
end
