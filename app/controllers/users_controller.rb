class UsersController < ApplicationController
  def new
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