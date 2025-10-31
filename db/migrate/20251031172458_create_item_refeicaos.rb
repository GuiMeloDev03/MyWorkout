class CreateItemRefeicaos < ActiveRecord::Migration[8.0]
  def change
    create_table :item_refeicaos do |t|
      t.references :alimento, null: false, foreign_key: true
      t.references :dia_dieta, null: false, foreign_key: true
      t.decimal :quantidade
      t.string :unidade_medida
      t.string :descricao

      t.timestamps
    end
  end
end
