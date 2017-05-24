class CreatePostComments < ActiveRecord::Migration[5.0]
  def change
    create_table :post_comments do |t|
      t.text :comment_entry, null: false
      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
