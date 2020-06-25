class AddCategoryToBoxes < ActiveRecord::Migration[6.0]
  def change
    add_reference :boxes, :box_category, foreign_key: true
  end
end
