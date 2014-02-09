class AccessLog < ActiveRecord::Base
  belongs_to :user
  geocoded_by :location   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  def get_location
    ip = self.ip || "211.35.135.99"
    url = "http://api.openapi.io/iptr/newapi/api_call.php?keycode=11111174&userip="+ip
    api_key = Rails.application.secrets.apistore_key
    file = File.new("./app/assets/images/mms_to_user.jpg",'rb')
    res = RestClient.get(url,
      'x-waple-authorization' => api_key
    )
    parser = Nori.new
    result = parser.parse(res)["nearapi"] unless parser.parse(res).nil?
    result = result["address"].split(";")[1] unless result.nil?
    return result
  end
  
  def near_stores
    i = 1
    length = 0
    while length < 4
      puts "@@search stores: "+length.to_s
      if self.latitude.nil?
        stores = Store.near([37.5146212,127.0554681],5)
      else
        stores = Store.near(self,i)
      end
      length = stores.length
      i += 1
    end
    return stores
  end
  
end
