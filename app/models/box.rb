class Box < ApplicationRecord
  belongs_to :user
  belongs_to :boxable, polymorphic: true, dependent: :destroy
  belongs_to :box_category

  validates :name, presence: true

  acts_as_list scope: [:user_id, :box_category_id]

  accepts_nested_attributes_for :boxable
  
  def build_boxable(params)
    self.boxable = Note.new(params)
  end
end
