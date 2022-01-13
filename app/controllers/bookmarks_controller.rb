class BookmarksController < ApplicationController

  def create
    anime = Anime.find(params[:anime_id])
    bookmark = Bookmark.new(bookmark_params)
    bookmark.save!
    redirect_back fallback_location: anime_path(anime.id), success: 'ブックマークしました'
  end

  def destroy
    bookmark = current_customer.bookmarks.find_by(anime_id:params[:anime_id])
    bookmark.destroy!
    redirect_back fallback_location: anime_path(params[:anime_id]), success: 'ブックマークを外しました'
  end

  private
  def bookmark_params
    params.permit(:anime_id).merge(customer:current_customer)
  end
end
