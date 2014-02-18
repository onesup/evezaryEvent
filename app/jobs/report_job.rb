class MessageJob
  include SuckerPunch::Job

  def perform(message, send_message, dest)
    message.send_mms(send_message, dest)
  end
  
  def later(sec, message, send_message, dest)
    after(sec) { perform(message, send_message, dest) }
  end
end