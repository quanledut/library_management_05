class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.integer :followed_id
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :follows, :followed_id
  end
end
