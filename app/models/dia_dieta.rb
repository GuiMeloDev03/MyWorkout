class DiaDieta < ApplicationRecord
  belongs_to :dieta

  has_many :item_refeicao, dependent: :destroy

  validates :nome, presence: true
  validates :objetivo, presence: true
end
