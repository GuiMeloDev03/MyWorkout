class Dieta < ApplicationRecord
  belongs_to :user

  has_many :refeicoes, dependent: :destroy

  accepts_nested_attributes_for :refeicoes, allow_destroy: true

  validates :nome, presence: true
  validates :objetivo, presence: true

  def total_calorias
    refeicoes.sum(:calorias).to_f
  end

  def total_proteinas
    refeicoes.sum(:proteinas).to_f
  end

  def total_carboidratos
    refeicoes.sum(:carboidratos).to_f
  end

  def total_gorduras
    refeicoes.sum(:gorduras).to_f
  end
end
