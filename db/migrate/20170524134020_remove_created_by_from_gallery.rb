class RemoveCreatedByFromGallery < ActiveRecord::Migration[5.0]
  def change
    remove_column :galleries, :created_by, :string
  end
end
