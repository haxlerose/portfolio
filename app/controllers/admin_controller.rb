# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @visitors = Visitor.includes(:ip_address).order(created_at: :desc).limit(500)
  end
end
