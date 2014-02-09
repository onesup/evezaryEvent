class MobileController < ApplicationController
  layout false
  protect_from_forgery except: :kakaotalk
  def near_stores
    lat = params["lat"]
    lng = params["lng"]
    i = 1
    length = 0
    unless lat.nil?
      while length < 4
        puts "@@search stores: "+length.to_s
        @stores = Store.near([lat,lng], i)
        length = @stores.length
        i += 1
      end
    else
      @stores = Store.near([37.5146212,127.0554681],5)
    end
  end
  
  def index    
  end
  
  def kakaotalk
    
  end
  
  def kakaostory
  end
  
  def facebook
  end
  
  
  def search_stores
    @cache = {
      myPhone_1: params[:myPhone_1],
      myPhone_2: params[:myPhone_2],
      myPhone_3: params[:myPhone_3],
      momPhone_1: params[:momPhone_1],
      momPhone_2: params[:momPhone_2],
      momPhone_3: params[:momPhone_3],
      ta: params[:ta]
    }
  end
  
  def apply_1
    @cache = {
      myPhone_1: params[:myPhone_1],
      myPhone_2: params[:myPhone_2],
      myPhone_3: params[:myPhone_3],
      momPhone_1: params[:momPhone_1],
      momPhone_2: params[:momPhone_2],
      momPhone_3: params[:momPhone_3],
      ta: params[:ta]
    }
  end
  
  def apply_2
  end
end
