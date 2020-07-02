class BoxCategory < ApplicationRecord
  belongs_to :user
  has_one :box, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :user }
end
