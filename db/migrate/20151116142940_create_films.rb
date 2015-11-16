class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name
      t.text :description
      t.string :cover
      t.json :video

      t.timestamps null: false
    end
  end
end
