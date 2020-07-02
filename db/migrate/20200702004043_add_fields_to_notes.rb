class AddFieldsToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :name, :string, null: false, default: ''
    remove_column :notes, :content, :string, null: false
  end
end
