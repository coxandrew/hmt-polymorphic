class CreateAlbumItems < ActiveRecord::Migration
  def change
    create_table :album_items do |t|
      t.references :album
      t.references :albumable
      t.string :albumable_type
      t.integer :position

      t.timestamps null: false
    end
  end
end
