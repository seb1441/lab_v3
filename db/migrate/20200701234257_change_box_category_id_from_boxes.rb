class ChangeBoxCategoryIdFromBoxes < ActiveRecord::Migration[6.0]
  def change
    change_column :boxes, :box_category_id, :bigint, null: false
  end
end
