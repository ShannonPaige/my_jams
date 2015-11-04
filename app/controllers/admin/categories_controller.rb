class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "You successfully created a category"
      redirect_to admin_categories_path
    else
      flash[:errors] = "Error: Try Again"
      render :new
    end
  end


  private

  def category_params
    params.require(:category).permit(:subject)
  end
end
