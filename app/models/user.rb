class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # after_create do
  #   Box.create(
  #     user: self,
  #     name: "",
  #     boxable: Note.create(content: "")
  #   )
  # end

end
