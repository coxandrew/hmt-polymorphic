class AlbumItemsController < ApplicationController
  def index
    album = Album.find(params[:id])
    page = params[:page] || 1

    render json: album, serializer: AlbumItemsSerializer, page: page
  end
end
