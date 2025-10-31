class Refeicao < ApplicationRecord
  belongs_to :dieta

  validates :nome, presence: true
  validates :nome, uniqueness: { scope: :dieta_id, message: "já existe nesta dieta" }
  validates :calorias, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :proteinas, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :carboidratos, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :gorduras, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
end
