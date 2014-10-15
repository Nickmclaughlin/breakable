class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
    @photo = Photo.new
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.received_posts.page params[:page]
    @photos = @user.photos
    @photos.each do |photo|
      profile_photo = []
      if photo.profile_photo == true
        profile_photo << photo.photo.url
      end
      @profile_photo = profile_photo.pop
    end
  end

  def index
    if params[:search]
      if !User.search(params[:search]).empty?
        @users = User.search(params[:search]).page params[:page]
      else
        @users = User.search_location(params[:search]).page params[:page]
      end
    else
      @users = User.all.sample(20)
    end
  end


  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "You have successfully updated your profile."
      redirect_to root_path
    else
      flash[:alert] = "Please update correctly."
      redirect_to user_path(@user)
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
    params.require(:user).permit(:sex, :first_name, :last_name, :username, :email, :profile_photo, :bio, :interests, :profession, :education, :age, :zip, :city, :state)
  end
end
