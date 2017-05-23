class PicturesController < ApplicationController

	before_action :set_picture, only: [:destroy, :show]

  def show
  end

	def destroy
		
		@picture.destroy
    	
    	respond_to do |format|
      		format.html { redirect_to gallery_url(name: @picture.gallery.name), notice: 'Picture was successfully destroyed.' }
      	end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

end
