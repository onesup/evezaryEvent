class Admin::MessagesController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  
  def index
    @messages = Message.order("id desc").page(params[:page]).per(500)
  end

  def show
  end
end
