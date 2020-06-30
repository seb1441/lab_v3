class BoxCategoriesController < ApplicationController
  before_action :set_box_category, only: [:update, :destroy]

  def create
    @box_category = BoxCategory.new(
      user: current_user,
      name: "Category ##{current_user.box_categories.count + 1}"
    )

    if @box_category.save
      respond_to do |format|
        format.html { redirect_to boxes_path }
      end
    end
  end

  def update
    @box_category.update(box_category_params)
  end

  private

  def box_category_params
    params.require(:box_category).permit(:name)
  end

  def set_box_category
    @box_category = BoxCategory.find(params[:id])
  end
end