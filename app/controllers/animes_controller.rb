class AnimesController < ApplicationController
  def index
    @animes = Anime.all
  end

  def show
    @anime = Anime.find(params[:id])
    @post = Post.new
    @comments = Post.where(anime_id: @anime.id).pluck('comment')
  end

  def new
    @anime = Anime.new
  end

  def create
    anime = Anime.new(anime_params)
    anime.save
    redirect_to animes_path
  end

  def edit
  end

  private
  def anime_params
    params.require(:anime).permit(:title)
  end
end
