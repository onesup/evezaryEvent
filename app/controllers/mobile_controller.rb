class MobileController < ApplicationController
  layout false
  def near_stores
    lat = params["lat"]
    lng = params["lng"]
    i = 1
    length = 0
    while length < 4
      puts "@@search stores: "+length.to_s
      @stores = Store.near([lat,lng], i)
      length = @stores.length
      i += 1
    end
    # options = Array.new
    # stores.each do |store|
    #   options << {store.id => store.title}
    # end
    # 
    # respond_to do |format|      
    #   format.json { render json: {stores: options.to_json}}
    # end  
  end
  
  def index
    
  end
  def apply_1
  end
  def apply_2
    
  end
end
