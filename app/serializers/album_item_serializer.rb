class AlbumItemSerializer < ActiveModel::Serializer
  attributes :id, :type, :position

  def id
    object.albumable_id
  end

  def type
    object.albumable_type
  end
end
