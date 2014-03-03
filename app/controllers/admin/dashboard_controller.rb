class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  
  def index
    @beginning_of_event = DateTime.parse("2014-02-01 00:00:00")
  end
end
