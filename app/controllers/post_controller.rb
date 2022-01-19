class PostController < ApplicationController
  def create
    anime = Anime.find(params[:anime_id])
    comment = current_customer.posts.new(post_params)
    comment.anime_id = anime.id
    comment.save
    redirect_to anime_path(anime.anime_id)
  end

  def destroy
    Post.find_by(id: params[:id]).destroy
    redirect_to anime_path(params[:anime_id])
  end

  private

  def post_params
    params.require(:post).permit(:comment, :rate)
  end
end
