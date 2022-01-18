class AnimesController < ApplicationController
  def index
    if params[:anime].present?
     if params[:anime].empty?
       @animes = Anime.all
     else
       @animes = Anime.where('title LIKE(?)', "%#{params[:anime][:keyword]}%")
     end
    else
      @animes = Anime.all
    end
  end

  def show
    if params[:id].present?
      @anime = Anime.find(params[:id])
    else
      @anime = Anime.new(anime_params)
      Anime.save
      redirect_to anime_path(anime.id)
    end

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

  def search
    respond_to do |format|
      format.html
      format.json
    end
  end

  def bookmarks
    @customer_animes = current_customer.bookmarks&.map(&:anime)
  end

  private
  def anime_params
    params.require(:anime).permit(:title)
  end
end
