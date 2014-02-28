class HomeController < ApplicationController
  def switch
    tracking_id = Rails.application.secrets.ga_tracking_id
    url = Rails.application.secrets.url
    Gabba::Gabba.new(tracking_id, url).page_view("pc/mobile switch page", "/")
    user_agent = UserAgent.parse(request.user_agent)
    if user_agent.mobile?
      redirect_to mobile_index_path({s: params[:s]})
    else
      redirect_to home_index_path({s: params[:s]})
    end
  end
  
  def download_image
    send_file Rails.root+"app/assets/images/blog_posting.jpg", :x_sendfile => true,
    :type=>"image/jpg", :filename => "blog_posting.jpg", :disposition => 'attachment'
  end  
  
  def index
    device = "pc"
    user_agent = UserAgent.parse(request.user_agent)
    device = "mobile" if user_agent.mobile?
    @log = AccessLog.new(ip: request.remote_ip, device: device)
    @log.location = @log.get_location || "서울시 강남구 삼성동 91-25"
    @log.save
  end

  def popUp_1
    render layout: false
  end

  def popUp_2
    tracking_id = Rails.application.secrets.ga_tracking_id
    url = Rails.application.secrets.url
    Gabba::Gabba.new(tracking_id, url).page_view("pc 문자 발송 팝업", "/home_index")  
    @log = AccessLog.find(params[:ip]) rescue AccessLog.first
    render layout: false
  end

  def popUp_3
    @log = AccessLog.find(params[:ip]) rescue AccessLog.first
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