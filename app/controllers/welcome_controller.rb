class WelcomeController < ApplicationController
  def index
    @users = User.search(params[:search]).page params[:page]
  end
end
