class HomeController < ApplicationController
  def switch
    device = "pc"
    user_agent = UserAgent.parse(request.user_agent)
    device = "mobile" if user_agent.mobile?
    log = AccessLog.new(ip: request.remote_ip, device: device)
    log.location = log.get_location
    log.save
    if user_agent.mobile?
      redirect_to mobile_index_path
    else
      redirect_to home_index_path
    end
  end
  def index
  end
  def popUp_1
    render layout: false
  end
  def popUp_2
    render layout: false
  end
  def popUp_3
    render layout: false
  end
  def popUp_4
    render layout: false
  end
  def popUp_5
    render layout: false
  end
  def popUp_blog
    render layout: false
  end
end