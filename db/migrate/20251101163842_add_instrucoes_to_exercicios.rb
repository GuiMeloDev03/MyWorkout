class AddInstrucoesToExercicios < ActiveRecord::Migration[8.0]
  def change
    add_column :exercicios, :instrucoes, :string
  end
end
