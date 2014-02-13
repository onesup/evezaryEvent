class Mobile::ViralActionsController < ApplicationController
  before_action :set_viral_action, only: [:show, :edit, :update, :destroy]
  def create
    @action = ViralAction.new(action_params)
    respond_to do |format|
      if @action.save
        @action.send_mms
        format.json { render json: @action.result, status: :created }
      else
        format.json { render json: @action.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viral_action
      @action = ViralAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def viral_action_params
      params.require(:viral_action).permit(:name, :phone, :email, :gift_id, :address)
    end
end
