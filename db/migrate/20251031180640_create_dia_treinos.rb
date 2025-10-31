class CreateDiaTreinos < ActiveRecord::Migration[8.0]
  def change
    create_table :dia_treinos do |t|
      t.string :nome
      t.references :treino, null: false, foreign_key: true

      t.timestamps
    end
  end
end
