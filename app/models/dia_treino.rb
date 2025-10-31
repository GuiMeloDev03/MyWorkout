class DiaTreino < ApplicationRecord
  belongs_to :treino

  has_many :exercicio_planos, dependent: :destroy
  validates :nome, presence: true
end
