class Api::V1::AnimesController < ApplicationController
  def index
    return if !params[:year] && !params[:season] && !params[:title]
    # paramsによって絞り込みの条件を変更
    
    query = params[:year] && params[:season] ? Work.where(year: params[:year], season: params[:season]) : Anime.where("title like ?", "%#{params[:title]}%")
    animes query.map do |anime|
      {
        id: anime.id,
        title: anime.title,
        year: anime.year,
        season: anime.season
      }
    end
    
    render json: { status:200, animes: animes}
  end
end
