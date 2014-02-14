class AccessLog < ActiveRecord::Base
  include DailyCount
  belongs_to :user
  belongs_to :message
  geocoded_by :location   # can also be an IP address
  # after_validation :geocode          # auto-fetch coordinates
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
    stores = Store.search_stores(location)
    return stores
  end

  def self.temporary_pc_daily_count(day)
    start_date = day.beginning_of_day
    end_date = day.end_of_day
    count = self.where("created_at >= :start_date AND created_at <= :end_date",
      {start_date: start_date, end_date: end_date}).where(device: "pc").count
  end
  
  def self.temporary_mobile_daily_count(day)
    start_date = day.beginning_of_day
    end_date = day.end_of_day
    count = self.where("created_at >= :start_date AND created_at <= :end_date",
      {start_date: start_date, end_date: end_date}).where(device: "mobile").count
  end
  
end
