class ExercicioPlano < ApplicationRecord
  belongs_to :dia_treino
  belongs_to :exercicio

  validates :series, numericality: { greater_than_or_equal_to: 1 }
  validates :repeticoes, numericality: { greater_than_or_equal_to: 1 }
  validates :carga_planejada, numericality: { greater_than_or_equal_to: 0 }
end
