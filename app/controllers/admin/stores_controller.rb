class Admin::StoresController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  
  def index
    
  end
  
  def top_stores
    @stores = Store.order('messages_count DESC').page(params[:page]).per(210)
  end
  
end
