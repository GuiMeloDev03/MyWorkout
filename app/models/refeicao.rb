class Refeicao < ApplicationRecord
  belongs_to :dieta

  before_validation :set_default_macros

  validates :nome, presence: true
  validates :nome, uniqueness: { scope: :dieta_id, message: "já existe nesta dieta" }
  validates :calorias, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :proteinas, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :carboidratos, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :gorduras, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  private

  def set_default_macros
    self.calorias ||=0
    self.proteinas ||=0
    self.carboidratos ||=0
    self.gorduras ||=0
  end
end
