class AddFieldsToFilms < ActiveRecord::Migration[6.1]
  def change
    add_column :films, :length, :integer
    add_column :films, :actor, :string
    add_column :films, :director, :string
  end
end
