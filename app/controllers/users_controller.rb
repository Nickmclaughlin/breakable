class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
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


  private
  def user_params
    params.require(:user).permit(:sex, :first_name, :last_name, :username, :email, :profile_photo, :bio, :interests, :profession)
  end

end
