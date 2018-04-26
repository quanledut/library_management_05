class CreateBorrowBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :borrow_books do |t|
      t.references :borrow, foreign_key: true
      t.integer :quantity, default: 1
      t.integer :book_id
      t.integer :cart_id
      t.date :return_date

      t.timestamps
    end
    add_index :borrow_books, :book_id
  end
end
