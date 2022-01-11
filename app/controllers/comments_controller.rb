class CommentsController < ApplicationController
  def index
   @anime = Anime.find(params[:anime_id])
   @comments = Post.where(anime_id: @anime.id)
  end
end
