class Message < ActiveRecord::Base
  def send_mms
    url = "http://api.openapi.io/ppurio/1/message/mms/minivertising"
    api_key = Rails.application.secrets.apistore_key
    time = (Time.now + 5.seconds).strftime("%Y%m%d%H%M%S")
    file = File.new("./app/assets/images/mms_to_user.jpg",'rb')
    res = RestClient.post(url,
      {
        "send_time" => (sent_at + 10.seconds).strftime("%Y%m%d%H%M%S"), 
        "dest_phone" => dest_phone, 
        "dest_name" => send_name,
        "send_phone" => send_phone, 
        "send_name" => send_name,
        "subject" => subject,
        "apiVersion" => "1", 
        "id" => "minivertising", 
        "msg_body" => msg_body,
        "file" => file,
        multipart: true
      },
      content_type: 'multipart/form-data',
      'x-waple-authorization' => api_key
    )
    cmid = JSON.parse(res)["cmid"]
    Message.report(cmid)
  end
  
  def report(cmid)
    api_key = Rails.application.secrets.apistore_key
    url = "http://api.openapi.io/ppurio/1/message/report/minivertising?cmid="+cmid
    result = RestClient.get(url, 'x-waple-authorization' => api_key)
    self.cmid = cmid
    self.result = result
    self.save!
  end
end
