class AddObservacaoToExercicioPlanos < ActiveRecord::Migration[8.0]
  def change
    add_column :exercicio_planos, :observacoes, :string
  end
end
