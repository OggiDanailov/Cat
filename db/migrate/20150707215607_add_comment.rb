class AddComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :user_id, null: false
    end
  end
end
