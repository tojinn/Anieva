class CustomersController < ApplicationController
  def index
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def follows
   @customer = Customer.find(params[:id])
   @following_customers = @customer.followings
  end

  def followers
    @customer = Customer.find(params[:id])
    @follower_customers = @customer.followers
  end
  private

  def star
    @customer = Customer.find(params[:id])
    @anime = Anime.find(params[:anime_id])
    @comments = Post.where(anime_id: @anime.id)
  end

  def customer_params
    params.require(:customer).permit(:name, :profile_image)
  end
end

