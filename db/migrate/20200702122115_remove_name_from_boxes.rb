class RemoveNameFromBoxes < ActiveRecord::Migration[6.0]
  def change
    remove_column :boxes, :name
  end
end
