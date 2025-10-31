class ItemRefeicao < ApplicationRecord
  belongs_to :alimento
  belongs_to :dia_dieta

  validates :quantidade, presence: true, numericality: { grater_than: 0 }
  validates :unidade_medida, presence: true
  validates :descricao, presence: true
end
