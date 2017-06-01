class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :name, null: false
      t.integer :part
      t.integer :isbn, null: false, unique: true
      t.integer :print_year, null: false
      t.references :stillage, index: true, foreign_key: true, null: false
      t.integer :shelf, null: false
      t.integer :copies, null: false

      t.timestamps null: false
    end
  end
end
