class AddColumnsToImage < ActiveRecord::Migration[5.1]
    def change
      add_reference :images, :imageable, polymorphic: true, index: true, optional: true 
      add_column :images, :image_file_name, :string
      add_column :images, :image_content_type, :string
      add_column :images, :image_file_size, :integer
      add_column :images, :image_updated_at, :datetime
      rename_table :images, :photos
    end
  end