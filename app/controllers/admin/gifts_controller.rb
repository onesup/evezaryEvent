class Admin::GiftsController < ApplicationController
	layout 'admin'

  def index
  	@gifts = Gift.order("id desc")
  end

  def show
  end
end
