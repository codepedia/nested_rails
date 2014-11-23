class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.integer :parent_id, index: true #Indexing for database for fast lookup

      t.timestamps
    end
  end
end
