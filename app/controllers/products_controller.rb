class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :set_type, only: [:index]
  before_action :set_category, only: [:index]
  before_action :set_brand, only: [:index]
  before_action :set_tag, only: [:index]

  def index
    @products = if @type
                  @type.products.page(params[:page]).per(15)
                elsif @category
                  @category.products.page(params[:page]).per(15)
                elsif @brand
                  @brand.products.page(params[:page]).per(15)
                elsif @tag
                  @tag.products.page(params[:page]).per(15)
                else
                  Product.page(params[:page]).per(15)
                end

    @association_name = @type&.name || @category&.name || @brand&.name || @tag&.name
  end

  def show
    @category = @product.category
    @brand = @product.brand
    @other_products = @category.products.where.not(id: @product.id)
    @tags = @product.tags
  end

  def filter
    @products = Product.all

    if params[:filter].present?
      @products = case params[:filter]
                  when 'new'
                    @products.where('created_at >= ?', 3.days.ago)
                  when 'on_sale'
                    @products.where(on_sale_status: true)
                  else
                    @products
                  end
    end

    @products = @products.page(params[:page]).per(15)
  end

  def filter_by_category
    @products = if params[:type_id].present?
                  Product.where(type_id: params[:type_id]).order(created_at: :desc).page(params[:page]).per(15)
                else
                  Product.order(created_at: :desc).page(params[:page]).per(15)
                end
  end

  def search
    @products = Product.all

    if params[:type_id].present? && params[:keyword].present?
      @products = @products.where(type_id: params[:type_id])
                           .where('name LIKE ?', "%#{params[:keyword]}%")
    elsif params[:type_id].present?
      @products = @products.where(type_id: params[:type_id])
    elsif params[:keyword].present?
      @products = @products.where('name LIKE ?', "%#{params[:keyword]}%")
    end

    @total_results = @products.size
    @products = @products.page(params[:page]).per(15)
  end

  def add_to_cart
    product_id = params[:product_id]
    quantity = params[:quantity].to_i

    cart = session[:cart] || {}
    cart[product_id] ||= 0
    cart[product_id] += quantity

    session[:cart] = cart
    redirect_to cart_path, flash: { notice: 'Product added to cart successfully.' }
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_type
    @type = Type.find(params[:type_id]) if params[:type_id]
  end

  def set_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end

  def set_brand
    @brand = Brand.find(params[:brand_id]) if params[:brand_id]
  end

  def set_tag
    @tag = Tag.find(params[:tag_id]) if params[:tag_id]
  end
end
