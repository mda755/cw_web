class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.text :name_full, null: false
      t.text :name_short, null: false
      t.index [:name_short, :name_full], unique: true 

      t.timestamps null: false
    end
  end
end
