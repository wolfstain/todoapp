class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :nombre
      t.text :descripcion
    end
  end
end
