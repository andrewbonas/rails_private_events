class UsersController < ApplicationController
 
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html {redirect_to root_path, notice: 'User was successfully created.'}
      else
        format.html { render :new, notice: 'Invalid, please try again.'}
      end
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end
end