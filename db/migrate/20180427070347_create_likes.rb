class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :liked_id
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :likes, :liked_id
  end
end
