class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new create confirm edit update destroy]
  before_action :correct_user, only: %i[edit update destroy]

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      PostMailer.post_mail(@post).deliver
      flash[:success] = 'Post created!'
      redirect_to root_url
    else
      render :new
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post updated!'
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :image_cache)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
