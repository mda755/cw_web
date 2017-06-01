class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.text :fname, null: false
      t.text :sname
      t.text :lname, null: false
      t.integer :index, null: false, unique: true

      t.timestamps null: false
    end
  end
end
