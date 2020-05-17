class UsersController < ApplicationController

    before_action :authenticate_user!

  def new
      @user = User.new
  end

  def create
  end

  def edit
  end

  def destroy
      @user = User.find(params[:id]).delete
      redirect_to root_path
  end

  def index
      @users = User.all
  end

  def show
    @user = User.find(params[:id])

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :description)
    end

end
