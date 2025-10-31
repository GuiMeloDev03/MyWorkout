class CreateAlimentos < ActiveRecord::Migration[8.0]
  def change
    create_table :alimentos do |t|
      t.string :nome
      t.integer :calorias

      t.timestamps
    end
  end
end
