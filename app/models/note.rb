class Note < ApplicationRecord
  has_one :box, as: :boxable, dependent: :destroy
  has_rich_text :rich_text
end
