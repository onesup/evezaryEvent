class Admin::ViralActionsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  
  def index
    @actions = ViralAction.order("id desc")
  end

  def show
    @actions = ViralAction.find(params[:id])
  end
end
