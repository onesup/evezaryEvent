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
  end
  
  def index    
  end
  
  def search_stores
  end
  
  def apply_1
  end
  
  def apply_2
  end
end
