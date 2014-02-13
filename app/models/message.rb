class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :store
  belongs_to :gift
  has_one :access_log
  
  validates :dest_phone, presence: true
  validates :send_phone, presence: true
  validates :msg_body, presence: true
  
  def send_mms(send_message, dest)
    url = "http://api.openapi.io/ppurio/1/message/mms/minivertising"
    api_key = Rails.application.secrets.apistore_key
    time = (Time.now + 5.seconds)
    files = [
      "./app/assets/images/bed_1_Img.jpg",
      "./app/assets/images/bed_2_Img.jpg",
      "./app/assets/images/bed_3_Img.jpg",
      "./app/assets/images/bed_4_Img.jpg",
      # "./app/assets/images/bed_5_Img.jpg", 부모님 혼수 침구 제외
      # "./app/assets/images/bed_6_Img.jpg",
      "./app/assets/images/bed_7_Img.jpg",
      "./app/assets/images/bed_8_Img.jpg"
    ]
    file = File.new(files.shuffle[1],'rb')
    res = RestClient.post(url,
      {
        "send_time" => time.strftime("%Y%m%d%H%M%S"), 
        "dest_phone" => dest, 
        "dest_name" => send_name,
        "send_phone" => send_phone, 
        "send_name" => send_name,
        "subject" => "이브자리 특별한 데이트",
        "apiVersion" => "1", 
        "id" => "minivertising", 
        "msg_body" => send_message,
        "file" => file,
        multipart: true
      },
      content_type: 'multipart/form-data',
      'x-waple-authorization' => api_key
    )
    cmid = JSON.parse(res)["cmid"]
    call_status = String.new
    start = Time.new
    during_time = 0
    while call_status.empty? or call_status == "result is null" or during_time < 3.minutes
      sleep(10.seconds)
      call_status = report(cmid, time)
      during_time = Time.now - start
    end
  end
  
  def report(cmid, time)
    api_key = Rails.application.secrets.apistore_key
    url = "http://api.openapi.io/ppurio/1/message/report/minivertising?cmid="+cmid
    result = RestClient.get(url, 'x-waple-authorization' => api_key)
    call_status = JSON.parse(result)["call_status"].to_s
    self.sent_at = time
    self.cmid = cmid
    self.result = result
    self.call_status = call_status
    self.save!    
    return call_status
  end
end
