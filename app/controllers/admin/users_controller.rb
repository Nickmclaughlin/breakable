class Admin::UsersController < ApplicationController
  before_filter :admin_authorize!
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:success] = "You have successfully deleted user."

    redirect_to admin_users_path
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "Successfully update the user"
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:sex, :first_name, :last_name, :username, :email, :bio, :interests, :profession, :education, :age, :zip, :city, :state)
  end
end
