class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  # POST /messages
  # POST /messages.json
  def create
    send_phone = params["my-phone-1"] + "-" + params["my-phone-2"] + "-" + params["my-phone-3"]
    dest_phone = params["mom-phone-1"] + "-" + params["mom-phone-2"] + "-" + params["mom-phone-3"]
    
    @message = Message.new(message_params)
    @message.sent_at = Time.now
    @message.send_phone = send_phone unless send_phone.nil?
    @message.dest_phone = dest_phone unless dest_phone.nil?
    respond_to do |format|
      if @message.save
        MessageJob.new.async.perform(@message)
        format.json { render json: {result: @message.result, id: @message.id}, status: :created }
        format.html { redirect_to mobile_apply_2_path, notice: 'User was successfully updated.' }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
        format.html { redirect_to mobile_apply_1_path, notice: '입력을 다시 한 번 확인해주세요.' }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:store_id, :dest_phone, :send_phone, :msg_body)
    end
  
end
