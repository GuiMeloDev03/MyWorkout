class Treino < ApplicationRecord
  belongs_to :user

  has_many :dia_treinos, dependent: :destroy
  validates :nome, presence: true
end
