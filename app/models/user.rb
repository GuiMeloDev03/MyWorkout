class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nome, presence: true, length: { maximum: 50 }

  has_many :dietas, dependent: :destroy
  has_many :treinos, dependent: :destroy
end
