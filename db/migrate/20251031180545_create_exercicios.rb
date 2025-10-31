class CreateExercicios < ActiveRecord::Migration[8.0]
  def change
    create_table :exercicios do |t|
      t.string :nome
      t.string :grupo_muscular

      t.timestamps
    end
  end
end
