# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    CreateVisitorService.call(request)
  end
end
