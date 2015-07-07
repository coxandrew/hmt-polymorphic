class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :albums

  has_many :album_items
  has_many :photos
  has_many :documents

  # Define as an attribute instead of has_many to prevent recursive albums
  def albums
    object.albums.map { |album| AlbumAlbumableSerializer.new(album).serializable_hash }
  end
end
