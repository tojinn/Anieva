class PostController < ApplicationController
  def create
    anime = Anime.find(params[:anime_id])
    comment = current_customer.posts.new(post_params)
    comment.anime_id = anime.id
    comment_count = Post.where(anime_id: params[:anime_id]).where(customer_id: current_customer.id).count
    if comment.valid?
      if comment_count < 1
        comment.save
        redirect_to anime_comments_path(anime.id), notice: "レビューを投稿しました"
      else
        redirect_to anime_comments_path(anime.id), notice: "レビューの投稿は1度までです"
      end
    else
      flash.now[:alert] = "レビューの保存に失敗しました"
      render :new
    end
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
