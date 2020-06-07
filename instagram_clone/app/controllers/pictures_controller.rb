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
    else
      p "Invalid submission"
    end
  end

  private
  def picture_params
    params.require(:picture).permit(:text, :image)
  end
end
