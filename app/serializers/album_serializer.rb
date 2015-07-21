class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :links # :album_items, :photos, :albums, :documents

  # has_many :album_items
  # has_many :photos
  # has_many :documents

  # TODO: Get pagination working with the album_item_serializer
  # def album_items
  #   object.album_items.paginate(page: serialization_options[:page])
  # end

  def links
    {
      album_items: album_items_path(object.id)
    }
  end

  # Use a custom serializer to prevent recursive albums in the JSON response
  def albums
    object.albums.map { |album| AlbumAlbumableSerializer.new(album).serializable_hash }
  end
end
