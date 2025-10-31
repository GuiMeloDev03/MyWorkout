class CreateDietas < ActiveRecord::Migration[8.0]
  def change
    create_table :dietas do |t|
      t.string :nome
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
