class RemoveUploadedByFromPicture < ActiveRecord::Migration[5.0]
  def change
    remove_column :pictures, :uploaded_by, :string
  end
end
