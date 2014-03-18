class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  
  def index
    @users = User.where.not(phone:nil).order("id desc").page(params[:page]).per(200)
  end

  def show
    @user = User.find(params[:id])
  end
  
  def viral
    @users = User.where.not(phone:nil).order("viral_score desc").limit(200).page(params[:page]).per(50)
  end
end
