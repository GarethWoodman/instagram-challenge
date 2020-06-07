class PicturesController < ApplicationController
  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    p "Picture Object => #{@picture.inspect}"
    p "Params: #{params}"

    if @picture.save
      p "Stored picture in db"
      redirect_to "/users/#{current_user.id}"
    else
      p "Invalid submission"
    end
  end

  def destroy
    p params
    Picture.find(params[:picture][:id]).destroy
    redirect_to "/users/#{current_user.id}"
  end

  private
  def picture_params
    params.require(:picture).permit(:text, :image)
  end
end
