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
      redirect_to "/users/#{@picture.user_id}"
    else
      p "Invalid submission"
    end
  end

  def destroy
    Picture.find(params[:picture][:id]).destroy
    redirect_to "/users/#{@picture.user_id}"
  end

  private
  def picture_params
    params.require(:picture).permit(:text, :image)
  end
end
