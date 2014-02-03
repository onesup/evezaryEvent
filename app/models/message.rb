class Message < ActiveRecord::Base
  def send_mms(user)
    api_key = Rails.application.secrets.apistore_key
    time = (Time.now + 5.seconds).strftime("%Y%m%d%H%M%S")
    RestClient.post( url,
      {
        params: {
          "send_time" => time.to_s, 
          "dest_phone" => user.phone, 
          "send_phone" => mentee.phone, 
          "send_name" => mentee.name,
          "subject" => "신청",
          "apiVersion" => "1", 
          "id" => "ffmentor", 
          "msg_body" => message
        }
        content_type: 'application/x-www-form-urlencoded;',
        'x-waple-authorization' => api_key,
      }
    )
  end
  def send_sms(mentee)
    api_key = Rails.application.secrets.apistore_key
    message = "팜팜멘토 알림>>" + mentee.name + "님 께서" + self.title + " 작업 참여를 신청하셨습니다."
    uri = URI.parse("http://api.openapi.io/ppurio/1/message/sms/ffmentor")
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Post.new(uri.request_uri)
    req.content_type = 'application/x-www-form-urlencoded;'
    req['x-waple-authorization'] = api_key
    time = (Time.now+5.seconds).strftime("%Y%m%d%H%M%S")
    req.set_form_data(
      "send_time" => time.to_s, 
      "dest_phone" => self.mentor.phone, 
      "send_phone" => mentee.phone, 
      "send_name" => mentee.name,
      "subject" => "신청",
      "apiVersion" => "1", 
      "id" => "ffmentor", 
      "msg_body" => message
    )
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end
    case res
    when Net::HTTPSuccess, Net::HTTPRedirection
      Rails.logger.info "@@@@@@ sms send OK"
      Rails.logger.info "@@@@@@ sender:" + mentee.name
      Rails.logger.info "@@@@@@ sender_phone:" + mentee.phone
      Rails.logger.info "@@@@@@ dest:" + self.mentor.phone
      return res
    else
      puts res.value
      return res
    end
  end
end
