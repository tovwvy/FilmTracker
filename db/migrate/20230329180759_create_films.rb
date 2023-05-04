class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :films do |t|
      t.string :name 
      t.text :describtion
      t.integer :year
      t.float :rating

      t.timestamps
    end
  end
end
