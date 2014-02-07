class MessageJob
  include SuckerPunch::Job

  def perform(message, send_message)
    message.send_mms(send_message)
  end
  
  def later(sec, message, send_message)
    after(sec) { perform(send_message) }
  end
end