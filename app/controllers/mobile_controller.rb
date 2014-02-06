class MobileController < ApplicationController
  layout false
  def near_stores
    lat = params["lat"]
    lng = params["lng"]
    stores = Store.near(lat,lng)
    respond_to do |format|      
      format.json { render json: {stores: stores}}
    end
    
  end
  def index
    
  end
  def apply_1
  end
  def apply_2
  end
end
