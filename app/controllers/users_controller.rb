class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
    @photo = Photo.new
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.received_posts.page params[:page]
  end

  def index
    @users = User.search(params[:search]).page params[:page]
  end


  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "You have successfully updated your profile."
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:success] = "You have successfully deleted your account."

    redirect_to root_path
  end

  private
  def user_params
    # return { zip: nil } unless params[:user]
    params.require(:user).permit(:sex, :first_name, :last_name, :username, :email, :profile_photo, :bio, :interests, :profession, :education, :age, :zip, :city, :state)
  end
end
