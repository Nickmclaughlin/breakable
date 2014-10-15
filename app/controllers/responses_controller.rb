class ResponsesController < ApplicationController
  def create
    @response = Response.new(response_params)
    @post = Post.find(params[:post_id])
    @response.post_id = params[:post_id]
    @response.poster_id = params[:user_id]
    @response.recipient_id = @post.recipient_id

    if @response.save
      flash[:success] = "You have successfully posted a message."
      redirect_to user_path(@post.recipient)
    else
      flash[:alert] = "Please fill out message in order to post response."
      redirect_to user_path(@post.recipient)
    end
  end

  private
  def response_params
    params.require(:response).permit(:body)
  end
end
