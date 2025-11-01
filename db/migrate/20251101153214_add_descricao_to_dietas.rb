class AddDescricaoToDietas < ActiveRecord::Migration[8.0]
  def change
    add_column :dietas, :descricao, :text
  end
end
