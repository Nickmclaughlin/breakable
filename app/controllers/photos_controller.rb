class PhotosController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @photos = @user.photos.page params[:page]
  end

  def create
    @photo = Photo.new(photo_params)
    @user = User.find(params[:user_id])
    @photo.user_id = params[:user_id]

    if @photo.save
      flash[:success] = "You have successfully added a photo."
      redirect_to user_path(@user)
    else
      flash[:alert] = "You need to submit photo."
      redirect_to edit_user_path(@user)
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.verify(params[:user_id]) == true
      flash[:notice] = "You can only have one profile picture"
      render 'edit'
    else
      if @photo.update(photo_params)
        flash[:success] = "You have successfully updated your photo."
        redirect_to user_photo_path(@photo.user, @photo)
      else
        render 'edit'
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    flash[:success] = "You have successfully deleted your photo."

    redirect_to user_photo_path(@photo.user, @photo)
  end

  private
  def photo_params
    # return {user_id: nil} unless params[:post_params]
    params.require(:photo).permit(:photo, :user_id, :description, :profile_photo)
  end
end
