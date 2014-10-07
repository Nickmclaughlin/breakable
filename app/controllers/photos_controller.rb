class PhotosController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @photos = @user.photos
  end

  def create
    @photo = Photo.new(photo_params)
    @user = User.find(params[:user_id])
    @photo.user_id = params[:user_id]

    if @photo.save
      flash[:success] = "You have successfully added a photo."
      redirect_to user_path(@user)
    else
      render 'users/show'
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:photo, :user_id, :description, :profile_photo)
  end
end
