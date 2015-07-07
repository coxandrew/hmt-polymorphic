class AlbumItemSerializer < ActiveModel::Serializer
  attributes :id, :albumable_id, :albumable_type, :position
end
