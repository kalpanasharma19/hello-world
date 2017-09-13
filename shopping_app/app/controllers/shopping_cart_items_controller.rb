class ShoppingCartItemsController < ApplicationController
  def show
    @customer = current_customer
  end
  def new
    @customer = Customer.find(params[:customer_id])
    @product = Product.find(params[:product_id])
  end
  def create
    @customer = current_customer
    @shopping_cart_item = @customer.shopping_cart_items.create(shopping_cart_item_params)
    if @shopping_cart_item.save
       render 'show'
    else
      flash[:danger] = "error"
      render 'new'
    end
  end

  def destroy
    @customer = current_customer
    @item = @customer.shopping_cart_items.find(params[:id])
    @item.destroy
    render 'show'
  end

  private
  def shopping_cart_item_params
    params.require(:shopping_cart_item).permit(:product_id, :qunatity)
  end
end
