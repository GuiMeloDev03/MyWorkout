class Exercicio < ApplicationRecord
  validates :nome, presence: true, uniqueness: true
  validates :grupo_muscular, presence: true
end
