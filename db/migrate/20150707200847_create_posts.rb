class CreatePosts < ActiveRecord::Migration
  def change
      create_table :posts do |t|
      t.text :body
      t.string :title
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
