class CreateBorrowBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :borrow_books do |t|
      t.references :borrow, foreign_key: true
      t.integer :book_id
      t.string :return_date

      t.timestamps
    end
    add_index :borrow_books, :book_id
  end
end
