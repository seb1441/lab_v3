class Box < ApplicationRecord
  belongs_to :user
  belongs_to :boxable, polymorphic: true, dependent: :destroy
  belongs_to :box_category, required: false

  accepts_nested_attributes_for :boxable
  
  def build_boxable(params)
    self.boxable = Note.new(params)
  end
end
