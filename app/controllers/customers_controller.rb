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
   @following_customers = @customer.following_customer
  end

  def followers
    @customer = Customer.find(params[:id])
    @follower_customers = @customer.follower_customer
  end
  private

  def customer_params
    params.require(:customer).permit(:name)
  end
end
