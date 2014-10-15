class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = User.find(params[:user_id])
    @post.recipient_id = params[:user_id]
    @post.poster_id = current_user.id

    if @post.save
      flash[:success] = "You have successfully posted a message."
      redirect_to user_path(@user)
    else
      flash[:alert] = "Please fill out message in order to post."
      redirect_to user_path(@user)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    flash[:success] = "You have successfully deleted this comment."
    redirect_to user_path(@post.recipient)
  end

  private

  def post_params
    params.require(:post).permit(:message, :recipent_id, :poster_id )
  end
end
