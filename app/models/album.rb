class Album < ActiveRecord::Base
  has_many :album_items
  has_many :photos, through: :album_items, source: :albumable, source_type: "Photo"
  has_many :documents, through: :album_items, source: :albumable, source_type: "Document"
end
