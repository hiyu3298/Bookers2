class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attachment :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, uniqueness: true,presence: true, length: { minimum: 2, maximum: 20}
  validates :introduction, length: { maximum: 50 }

  has_many :books, dependent: :destroy
end
