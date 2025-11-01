class AddCargaToExercicioPlanos < ActiveRecord::Migration[8.0]
  def change
    add_column :exercicio_planos, :carga, :string
  end
end
