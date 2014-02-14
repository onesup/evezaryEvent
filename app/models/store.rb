class Store < ActiveRecord::Base
  include DailyCount
  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  
  def self.address_to_coord(address)
    address = "목동"
    key = Rails.application.secrets.naver_map_key
    query_url = "http://openapi.map.naver.com/api/geocode.php?encoding=utf-8&coord=LatLng&key=" + key
    # query_url = query_url + "&query=" + address
    resource = RestClient.get query_url, query: address
    # result = resource.get 
  end
end
