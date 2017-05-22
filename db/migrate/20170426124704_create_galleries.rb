class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.text :description
      t.string :created_by, null: false
      t.string :updated_by

      t.timestamps
    end
  end
end
