class RobotsController < ApplicationController
  layout false

  def show
    render plain: <<~ROBOTS
      User-agent: *
      Allow: /
      Sitemap: #{request.protocol}#{request.host_with_port}/sitemap.xml
    ROBOTS
  end
end
