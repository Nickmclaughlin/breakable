class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.save
      flash[:notice] = "You have successfully posted your comment."
      redirect_to users_path(@user)
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:body)
  end
end
