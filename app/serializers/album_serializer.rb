class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :album_items, :photos, :albums, :documents

  # has_many :album_items
  # has_many :photos
  # has_many :documents

  def album_items
    object.album_items.paginate(page: serialization_options[:page])
  end

  # Use a custom serializer to prevent recursive albums in the JSON response
  def albums
    object.albums.map { |album| AlbumAlbumableSerializer.new(album).serializable_hash }
  end
end
