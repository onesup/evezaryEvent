class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  # POST /logs
  # POST /logs.json
  def create
    @log = AccessLog.new(log_params)
    respond_to do |format|
      if @log.save
        @log.send_mms
        format.json { render json: @log.result, status: :created }
      else
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to @log, notice: 'AccessLog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = AccessLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:ip, :location, :device, :user_id)
    end
end
