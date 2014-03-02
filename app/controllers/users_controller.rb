class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # POST /users
  # POST /users.json
  def create
    send_phone = params["p1"].to_s + "-" + params["p2"].to_s + "-" + params["p3"].to_s
    @user = User.new(user_params)
    @user.phone = send_phone unless send_phone == "--"
    unless User.exists?(phone: @user.phone)
      @user = User.new(user_params)
      @user.blog_code = @user.random_code
      if user_params[:gift_id].nil?
        @user.gift = Gift.find_by_title("blank")
      else
        @user.gift = Gift.find(@user.gift_id)
      end
      
      
      respond_to do |format|
        if @user.save
          store = Store.find(params["store_id"])
          send_message = to_user(store)
          @message = Message.new({
            send_phone: @user.phone,
            dest_phone: @user.phone,
            msg_body: send_message,
            store_id: store,
          })
          @message.save
          @user.messages << @message
          if AccessLog.exists?(id: params["ip"])
            log = AccessLog.find(params["ip"])
            log.user = @user
            log.message = @message
            log.save
          end
          MessageJob.new.async.perform(@message, send_message, @user.phone)
          format.html { redirect_to(mobile_index_path({blog_code: @user.blog_code}), notice: 'User was successfully updated.') }
          format.json { render json: {status: "success", blog_code: @user.blog_code}, status: :created }
        else
          format.html { redirect_to(mobile_apply_2_path, notice: '입력을 다시 한 번 확인해주세요.') }
          format.json { render json: {status: @user.errors}, status: :unprocessable_entity }
        end
      end
    else
      @user = User.find_by_phone(@user.phone)
      if @user.blog_code.nil?
        @user.blog_code = @user.random_code
        @user.save
      end
      if @user.address.nil?
        @user.address = user_params[:address]
        @user.save
      end
      Rails.logger.info("이미 전화번호 입력한 사용자: "+@user.phone.to_s)
      @user.save
      store = Store.find(params["store_id"])
      send_message = to_user(store)
      @message = Message.new({
        send_phone: @user.phone,
        dest_phone: @user.phone,
        msg_body: send_message,
        store_id: store,
        sent_at: Time.now,
        send_name: @user.name
      })
      @message.save
      @user.messages << @message
      if AccessLog.exists?(id: params["ip"])
        log = AccessLog.find(params["ip"])
        log.user = @user
        log.message = @message
        log.save
      end
      MessageJob.new.async.perform(@message, send_message, @user.phone)
      respond_to do |format|
        format.html { redirect_to(mobile_index_path({blog_code: @user.blog_code}), notice: '이미 참여하셨습니다.') }
        format.json { render json: {status: "success", blog_code: @user.blog_code}, status: :created }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def tracking_log
    user = User.find_by_blog_code params[:id]
    unless user.nil?
      user.viral_score += 1
      user.save
      data = {score: user.viral_score}
      respond_to do |format|
        format.html {redirect_to root_path}
        format.json {render json: data}
      end
    else
      data = {score: 0}
      respond_to do |format|
        format.html {redirect_to root_path}
        format.json {render json: data}
      end
    end
  end
  
  def search_stores
    address = user_params["address"]
    @stores = Store.search_stores(address)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :phone, :email, :gift_id, :address)
    end
    
    def store_info(store)
store.title+"
"+store.address+"
"+store.phone
    end
    
    def to_user(store)
"
지금 사랑하는 사람과 함께 이브자리로 오세요!
이불은 만져보고 골라야죠! 

매장위치"+"
"+store_info(store) +"
소문내기 이벤트에 참여하시면 
당첨확률이 높아집니다
http://e3.minivertising.kr"
    end
    
end
