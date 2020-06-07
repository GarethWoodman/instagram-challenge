class CommentsController < ApplicationController
  def new
    @comment = Comments.new
  end

  def create
    @picture = Picture.find(params[:comment][:picture_id])

    @comment = @picture.comments.build(comments_params)
    @comment.user_id = current_user.id

    if @comment.save
      p "Stored comment in db"
      redirect_to "/users/#{params[:comment][:user_id]}"
    else
      p "Invalid submission"
    end
  end

  def destroy
    @comment = Comment.find(params[:comment][:id])
    @user_of_picture = @comment.picture.user_id

    @comment.destroy

    redirect_to "/users/#{@user_of_picture}"
  end

  private
  def comments_params
    params.require(:comment).permit(:message)
  end
end
