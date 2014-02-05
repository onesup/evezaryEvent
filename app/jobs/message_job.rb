class MessageJob
  include SuckerPunch::Job

  def perform(message)
    message.send_mms
  end
end