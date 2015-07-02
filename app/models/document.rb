class Document < ActiveRecord::Base
  has_many :album_items, as: :albumable
  has_many :albums, through: :album_items
end
