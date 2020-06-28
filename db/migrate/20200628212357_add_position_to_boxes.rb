class AddPositionToBoxes < ActiveRecord::Migration[6.0]
  def change
    add_column :boxes, :position, :integer
  end
end
