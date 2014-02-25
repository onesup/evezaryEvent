class ReportJob
  include SuckerPunch::Job

  def perform(interval_time, finish_time)
    message.waiting_for_result(interval_time, finish_time)
  end
  
  # def later(sec, message, send_message, dest)
  #   after(sec) { perform(message, send_message, dest) }
  # end
end