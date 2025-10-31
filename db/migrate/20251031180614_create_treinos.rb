class CreateTreinos < ActiveRecord::Migration[8.0]
  def change
    create_table :treinos do |t|
      t.string :nome
      t.string :objetivo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
