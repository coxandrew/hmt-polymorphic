class AlbumItemsController < ApplicationController
  respond_to :json

  def index
    album = Album.find(params[:id])
    respond_with album.album_items
  end
end
