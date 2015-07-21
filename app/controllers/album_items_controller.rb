class AlbumItemsController < ApplicationController
  respond_to :json

  def index
    album = Album.find(params[:id])

    render json: {
      album_items: album.album_items.map { |album_item| AlbumItemSerializer.new(album_item).serializable_hash },
      albums: album.albums,
      photos: album.photos,
      documents: album.documents
    }
  end
end
