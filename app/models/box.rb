class Box < ApplicationRecord
  belongs_to :user
  belongs_to :boxable, polymorphic: true, dependent: :destroy
  belongs_to :box_category, required: false
end
