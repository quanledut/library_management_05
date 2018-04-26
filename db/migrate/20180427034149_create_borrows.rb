class CreateBorrows < ActiveRecord::Migration[5.1]
  def change
    create_table :borrows do |t|
      t.references :user, foreign_key: true
      t.date :borrow_date
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
