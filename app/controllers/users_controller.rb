class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def new
   @user = User.new
  end
  
  def create
   @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
     redirect_to root_path , notice: 'プロフィールを編集しました'
    else
     render 'edit'
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @follower = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @followed = @user.follower_users
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :area, :body, :email, :password, :password_confirmation)
  end
  
  def set_user
     @user = User.find(params[:id])
  end
end