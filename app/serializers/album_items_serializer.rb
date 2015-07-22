class AlbumItemsSerializer < ActiveModel::Serializer
  root false
  attributes :meta, :album_items, :albums, :photos, :documents

  def meta
    {
      page: serialization_options[:page].to_i,
      per_page: WillPaginate.per_page
    }
  end

  def paginated_album_items
    # TODO: memoize this into an instance variable?
    object.album_items.paginate(page: serialization_options[:page])
  end

  def album_items
    paginated_album_items.map { |album_item| AlbumItemSerializer.new(album_item).serializable_hash }
  end

  def albums
    album_ids = paginated_album_items.select { |ai| ai.albumable_type == "Album" }.map { |a| a.id }
    object.albums.where(id: album_ids)
  end

  def photos
    photo_ids = paginated_album_items.select { |ai| ai.albumable_type == "Photo" }.map { |p| p.id }
    object.photos.where(id: photo_ids)
  end

  def documents
    document_ids = paginated_album_items.select { |ai| ai.albumable_type == "Document" }.map { |d| d.id }
    object.documents.where(id: document_ids)
  end
end
