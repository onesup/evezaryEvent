class Admin::GiftsController < ApplicationController
	layout 'admin'

  def index
  	@gifts = Gift.order("id desc")
    @mobile_users = User.includes(:messages).where( :messages => { :user_id => nil } ).where("users.name IS NOT NULL")
  end

  def show
    @gift = Gift.find params[:id]
    @users = User.joins(:messages).where("messages.user_id is not null")
    @users = @users.where("users.gift_id" => @gift.id).order("users.viral_score desc").uniq.limit 300
    # @users = User.includes(:messages).where("messages.user_id IS NOT NULL").order("users.viral_score desc").limit 300
    # @seoul_users = @gift.users.order("viral_score desc").limit 200
  end
  
  def mobile_users
    @users = User.includes(:messages).where( :messages => { :user_id => nil } )
    @users = @users.where("users.name IS NOT NULL").order("users.viral_score desc").limit(500)
  end
  
end
