class CreateRefeicaos < ActiveRecord::Migration[8.0]
  def change
    create_table :refeicoes do |t|
      t.references :dieta, null: false, foreign_key: true
      t.string :nome
      t.text :descricao
      t.integer :calorias
      t.decimal :proteinas
      t.decimal :carboidratos
      t.decimal :gorduras

      t.timestamps
    end
  end
end
