class AddObjetivoToDietas < ActiveRecord::Migration[8.0]
  def change
    add_column :dietas, :objetivo, :string
  end
end
