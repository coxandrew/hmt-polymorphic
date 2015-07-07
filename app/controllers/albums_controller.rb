class AlbumsController < ApplicationController
  respond_to :json

  def show
    @album = Album.find(params[:id])
    respond_with @album
  end
end
