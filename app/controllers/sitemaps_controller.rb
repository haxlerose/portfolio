class SitemapsController < ApplicationController
  layout false

  def show
    @blog_posts = BlogPost.all

    respond_to do |format|
      format.xml
    end
  end
end
