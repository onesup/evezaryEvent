class Admin::StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_store
  layout 'admin'
  
  def index
    
  end
  
  def top_stores
    @stores = Store.order('messages_count DESC').page(params[:page]).per(210)
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to admin_path, notice: 'Store was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:latitude, :longtitude)
    end
end
