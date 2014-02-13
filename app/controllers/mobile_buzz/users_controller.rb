class MobileBuzz::UsersController < ApplicationController  
  layout false
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
    @platform = params[:platform]
    
  end

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
      if AccessLog.exists?(id: params["ip"])
        unless @user.access_logs.where(id: params["ip"]).empty?
          @user.access_logs << AccessLog.find(params["ip"])
        end
      end
      cache = {platform: params[:platform], blog_code: @user.blog_code}
      respond_to do |format|
        if @user.save
          format.html { redirect_to(mobile_index_path(cache), notice: 'User was successfully updated.') }
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
      cache = {platform: params[:platform], blog_code: @user.blog_code}
      respond_to do |format|
        format.html { redirect_to(mobile_index_path(cache), notice: '이미 참여하셨습니다.') }
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
    user = User.new
    user.update(user_params)
    i = 1
    length = 0
    if user.address.nil?
      user.address = "서울시 강남구 삼성동"
    end
    while length < 4
      @stores = Store.near(user, i)
      length = @stores.length
      i += 1
      if i > 60
        Rails.logger.info "없는 매장 검색: "+user.address
        break
      end
    end

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
end
