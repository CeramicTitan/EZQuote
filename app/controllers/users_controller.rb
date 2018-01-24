class UsersController < ApplicationController
  before_action :require_admin
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
  def create
    @user = User.new(user_params)
     if @user.save
      redirect_to project_path(@user)
    else
      render 'pages/index'
    end
  end
  private

  def user_params
    params.require(:user).permit(:first_name,:last_name, :email, :password)
  end

end