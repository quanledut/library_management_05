class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address
      t.date :create_date
      t.string :password_digest
      t.integer :role, default: 1

      t.timestamps
    end
  end
end
