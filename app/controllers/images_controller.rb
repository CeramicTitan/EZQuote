class ImagesController < ApplicationController
  
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to project_path(@image.project_id)
  end
end