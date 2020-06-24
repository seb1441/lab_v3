class AddColorToBoxes < ActiveRecord::Migration[6.0]
  def change
    add_column :boxes, :color, :string, null: false, default: "#f05252"
  end
end
