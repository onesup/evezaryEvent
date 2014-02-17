class Admin::MessagesController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  
  def index
    if params[:store_id].nil?
      @messages = Message.order("id desc").page(params[:page]).per(500)
    else
      @messages = Store.find(params[:store_id]).messages.order("id desc").page(params[:page]).per(50)
    end
  end

  def show
  end
  
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_to do |format|
      format.html { redirect_to admin_store_messages_path(params[:store_id]) }
      format.json { head :no_content }
    end
  end
end
