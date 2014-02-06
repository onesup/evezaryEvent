class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    unless User.exists?(phone: @user.phone)
      @user = User.new(user_params)
      @user.blog_code = @user.random_code
      @user.gift = Gift.find(@user.gift_id)
      if AccessLog.exists?(id: params["ip"])
        unless @user.access_logs.where(id: params["ip"]).empty?
          @user.access_logs << AccessLog.find(params["ip"])
        end
      end
      respond_to do |format|
        if @user.save
          format.json { render json: {blog_code: @user.blog_code}, status: :created }
        else
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      format.json { render json: {notice: "error"} }
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
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :phone, :email, :gift_id)
    end
end