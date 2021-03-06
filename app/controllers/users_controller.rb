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
    @profile_photo = @user.prof_photo(@photos)
    @response = Response.new
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

  def nudge
    @user = User.find(params[:user_id])
    @nudge = Nudge.find_or_create_by(nudger_id: current_user.id)
    @nudge.recipient_id = params[:user_id]

    @nudge.score +=1

    if @nudge.save
      flash[:success] =  "You nudged #{@user.username}"
      redirect_to user_path(@user)
    else
      flash[:warning] = "Already Nudged"
      redirect_to user_path(@user)
    end
  end

  def nudge_delete
    @nudge = Nudge.find_by(recipient_id: params[:user_id])
    @nudge.destroy

    redirect_to user_path(current_user)
  end

  private
  def user_params
    params.require(:user).permit(:sex, :first_name, :last_name, :username, :email, :profile_photo, :bio, :interests, :profession, :education, :age, :zip, :city, :state, :message_me_if, :children, :future, :favorites, :looking_for, :height)
  end
end
