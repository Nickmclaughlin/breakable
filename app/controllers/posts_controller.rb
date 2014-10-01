class PostsController < ApplicationController
  def create
    @post = Post.new(review_params)
    @post.user = current_user
    @post.user_id = params[:user_id]

    if @post.save
      flash[:success] = "You have successfully posted a message."
      redirect_to user_path(@post.user)
    else
      render 'users/show'
    end
  end

  private
  def review_params
    params.require(:post).permit(:title, :message, :user_id)
  end
end
