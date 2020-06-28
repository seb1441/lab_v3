class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable
         
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  has_many :boxes

  
  # after_create do
  #   Box.create(
  #     user: self,
  #     name: "",
  #     boxable: Note.create(content: "")
  #   )
  # end

end
