class ViralActionsController < ApplicationController
  before_action :set_viral_action, only: [:show, :edit, :update, :destroy]
  def create
    @action = ViralAction.new(viral_action_params)
    respond_to do |format|
      if @action.save
        user = User.find_by_blog_code(params[:blog_code]) if User.exists?(blog_code: params[:blog_code])
        @action.user = user unless user.nil?
        @action.save
        format.json { render json: @action.id, status: :created }
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
      params.require(:viral_action).permit(:platform, :device, :user_id)
    end
  
end
