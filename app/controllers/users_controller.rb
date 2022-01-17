class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[edit update favorites]
  before_action :correct_user, only: %i[edit update]

  def index
    @posts = Post.all
    @favorites = current_user.favorites
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'your account has been created!'
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Profile has been updated.'
      redirect_to root_url
    else
      render :edit
    end
  end

  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favorite_posts
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end
end
