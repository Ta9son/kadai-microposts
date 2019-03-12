class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    #binding.pry

    micropost = Micropost.find(params[:favorite_posts])
    current_user.favorite(micropost)
    flash[:success] = 'お気に入りに登録しました。'
    #redirect_to micropost
    #redirect_to current_user
    redirect_back(fallback_location: root_url)
  end

  def destroy
    f = Micropost.find(params[:favorite_posts])
    current_user.unfavorite(f)
    flash[:success] = 'お気に入りを解除しました。'
     redirect_back(fallback_location: root_url)
  end
end