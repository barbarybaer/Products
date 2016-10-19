class ProductsController < ApplicationController
  def index
    @products = Product.find_by_sql("select products.id, products.name p_name, description, pricing , categories.name c_name from products left join categories on categories.id = products.category_id")
  end

  def new
    @category = Category.all
  end

  def show
    @product = Product.find_by_sql("select products.id, products.name p_name, description,pricing , categories.name c_name from products left join categories on categories.id = products.category_id where products.id = #{params[:id]}").first
    @comments = Comment.find_by_sql("select comment || ' ' || strftime('%m/%d/%Y',created_at) comment from comments where product_id = #{params[:id]}")
      # render json: @comments
  end

  def edit
    # @product = Product.find(params[:id])
    @product = Product.find_by_sql("select products.id p_id, products.name p_name, description,pricing , category_id, categories.name c_name from products left join categories on categories.id = products.category_id where products.id = #{params[:id]}").first
    @category = Category.all
    # render json: @product
  end

  def create
    p = Product.new(product_params)

    if p.save
      redirect_to '/products'
    else
      flash[:errors] = p.errors.full_messages
      redirect_to :back
    end
  end

  def update
    p = Product.find(params[:id])
    
    if p.update(product_params)
      redirect_to '/products'
    else
      flash[:errors] = p.errors.full_messages
      redirect_to :back
    end
    
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to :root
  end

  private 
  def product_params
    params.require(:product).permit(:name, :description, :pricing, :category_id)
  end
end
