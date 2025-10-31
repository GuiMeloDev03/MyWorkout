class CreateExercicioPlanos < ActiveRecord::Migration[8.0]
  def change
    create_table :exercicio_planos do |t|
      t.references :dia_treino, null: false, foreign_key: true
      t.references :exercicio, null: false, foreign_key: true
      t.integer :series
      t.integer :repeticoes
      t.decimal :carga_planejada

      t.timestamps
    end
  end
end
