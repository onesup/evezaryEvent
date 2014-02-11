class Mobile::MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    my_phone = params["myPhone_1"] + "-" + params["myPhone_2"] + "-" + params["myPhone_3"]
    mom_phone = params["momPhone_1"] + "-" + params["momPhone_2"] + "-" + params["momPhone_3"]
    @message.sent_at = Time.now
    @message.send_phone = my_phone unless my_phone == "--"
    @message.dest_phone = mom_phone unless mom_phone == "--"
    send_phone_copy = @message.send_phone
    dest_phone_copy = @message.dest_phone
    msg_body_copy = @message.msg_body
    respond_to do |format|
      if @message.save
        send_message = to_mom(@message.msg_body, @message.store)
        @message.save
        # Rails.logger.info @message.msg_body
        # 엄마에게
        MessageJob.new.async.perform(@message, send_message, dest_phone_copy)
        @message.msg_body = to_user(@message.store)
        @message.dest_phone = @message.send_phone
        @message.save
        # Rails.logger.info @message.msg_body
        # 나에게
        send_message = to_user(@message.store)
        MessageJob.new.async.later(10, @message, send_message, send_phone_copy)
        @message.msg_body = msg_body_copy
        @message.dest_phone = dest_phone_copy
        @message.save
        @message.access_log = AccessLog.find(params[:ip]) rescue AccessLog.first  
        my_phone_hash = {message_id: @message.id, p1: params["myPhone_1"].to_s, p2: params["myPhone_2"].to_s, p3: params["myPhone_3"].to_s}
        format.html { redirect_to(mobile_apply_2_path(my_phone_hash), notice: 'Message was successfully updated.') }
        format.json { render json: {status: "success", blog_code: @message.blog_code}, status: :created }
      else
        format.html { redirect_to(mobile_apply_1_path, notice: '입력을 다시 한 번 확인해주세요.') }
        format.json { render json: {status: @message.errors}, status: :unprocessable_entity }
      end
    end
  end
  
  private
    def message_params
      params.require(:message).permit(:store_id, :dest_phone, :send_phone, :msg_body)
    end
    
    def store_info(store)
store.title+"
"+store.address+"
"+store.phone
    end
    
    def to_mom(msg_body, store)
"
 "+msg_body+"
오랜만에 데이트도 하면서 
이브자리로 이불 고르러
같이 가요!

매장위치"+"
"+store_info(store)
    end
    
    def to_user(store)
"
지금 엄마와 함께 
혼수이불 고르러 
이브자리로 오세요! 
이불은 만져보고 골라야죠!

매장위치"+"
"+store_info(store) +"
소문내기 이벤트에 참여하시면 
당첨확률이 높아집니다
http://event3.evezary.co.kr"
    end
    
  
end
