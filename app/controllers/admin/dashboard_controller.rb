class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  
  def index
    # @beginning_of_event = DateTime.parse("2014-02-01 00:00:00")
    @beginning_of_event = (Time.now - 14.days).beginning_of_day
  end
end
