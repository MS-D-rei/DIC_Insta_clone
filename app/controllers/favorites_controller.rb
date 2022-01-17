class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    @favorite = current_user.favorites.create(post_id: params[:post_id])
    flash[:success] = 'Like new post'
    redirect_to request.referer
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    flash[:success] = 'Unlike the post'
    redirect_to request.referer
  end
end
