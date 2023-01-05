class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(cate_params)
    if @category.save
      flash[:notice] = 'Category has been created'
      redirect_to categories_path
    else
      flash[:notice] = 'Invalid Category'
    end
  end

  private

  def cate_params
    params.require(:category).permit(:name, :image)
  end
end
