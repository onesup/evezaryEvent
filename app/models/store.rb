require 'addressable/uri'
class Store < ActiveRecord::Base
  include DailyCount
  has_many :messages
  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  
  def self.address_to_coord(address)
    address = "목동" if address.nil?
    key = Rails.application.secrets.naver_map_key
    query_url = "http://openapi.map.naver.com/api/geocode.php?encoding=utf-8&coord=LatLng&key=" + key
    query_url = query_url + "&query=" + address
    query_url = Addressable::URI.parse(query_url).normalize.to_str
    resource = RestClient.get query_url
    result = Nokogiri::XML(resource)
    if result.css("total").text.to_i > 0
      lat = result.css("item").first.css("point y").text.to_f
      lng = result.css("item").first.css("point x").text.to_f
      coord = [lat, lng]
    else
      coord = "not_found"
    end
    return coord
  end
  
  def self.search_stores(address)
    if address.nil?
      address = "서울시 강남구 삼성동"
    end
    coord = Store.address_to_coord(address)
    if coord == "not_found"
      Rails.logger.info "not_found: " + address + coord.to_s
    else
      i = 1
      length = 0
      while length < 4
        @stores = Store.near(coord, i)
        length = @stores.length
        i += 1
        if i > 60
          Rails.logger.info "없는 매장 검색: " + address
          break
        end
      end
    end
    return @stores
  end

end
