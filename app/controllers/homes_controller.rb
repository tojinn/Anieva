class HomesController < ApplicationController
  def top
    @animes = Anime.joins(:posts).group(:id).order("AVG(posts.rate) desc")
  end
end
