class Admin::PhotosController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @photos = @user.photos.page params[:page]
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    flash[:success] = "You have successfully deleted photo."
    redirect_to admin_users_path
  end
end
