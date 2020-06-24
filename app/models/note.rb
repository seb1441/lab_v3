class Note < ApplicationRecord
  has_one :box, as: :boxable, dependent: :destroy
end
