class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.references :author, foreign_key: true
      t.integer :price
      t.string :publisher
      t.string :detail
      t.references :category, foreign_key: true
      t.integer :total_amount
      t.integer :ready_amount

      t.timestamps
    end
  end
end
