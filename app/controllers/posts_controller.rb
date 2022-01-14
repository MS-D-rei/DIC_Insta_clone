class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new create edit update destroy]

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
