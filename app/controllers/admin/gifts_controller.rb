class Admin::GiftsController < ApplicationController
	layout 'admin'

  def index
  	@gifts = Gift.order("id desc")
  end

  def show
    @gift = Gift.find params[:id]
    @users = @gift.users.order("viral_score desc").limit 200
  end
  
end
