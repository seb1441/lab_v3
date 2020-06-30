class BoxCategory < ApplicationRecord
  belongs_to :user
  has_one :box, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end
