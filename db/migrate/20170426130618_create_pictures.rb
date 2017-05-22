class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.integer :gallery_id, null: false
      t.text :description
      t.string :uploaded_by, null: false

      t.timestamps
    end
  end
end
