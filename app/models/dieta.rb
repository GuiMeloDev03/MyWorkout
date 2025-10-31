class Dieta < ApplicationRecord
  belongs_to :user

  has_many :dia_dietas, dependent: :destroy

  validates :nome, presence: true
end
