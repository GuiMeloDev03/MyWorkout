class Dieta < ApplicationRecord
  belongs_to :user

  has_many :dia_dietas, dependent: :destroy

  accepts_nested_attributes_for :refeicoes, allow_destroy: true

  validates :nome, presence: true
  validates :objetivo, presence: true
end
