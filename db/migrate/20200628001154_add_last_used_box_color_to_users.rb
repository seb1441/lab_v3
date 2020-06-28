class AddLastUsedBoxColorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_used_box_color, :string
  end
end
