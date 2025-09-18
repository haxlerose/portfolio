# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to admin_path if user_signed_in?

    CreateVisitorService.call(request)
  end
end
