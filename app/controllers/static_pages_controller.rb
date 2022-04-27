class StaticPagesController < ApplicationController

  def home

  end

  def user_dashboard
    @userInfo = params[:userInfo]
  end
end


