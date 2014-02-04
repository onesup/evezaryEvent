class AccessLog < ActiveRecord::Base
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
end
