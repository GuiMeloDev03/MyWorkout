class CreateDiaDietas < ActiveRecord::Migration[8.0]
  def change
    create_table :dia_dietas do |t|
      t.string :nome
      t.references :dieta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
