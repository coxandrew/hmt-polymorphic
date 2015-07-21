class AlbumsController < ApplicationController
  respond_to :json

  def show
    page = params[:page] || 1
    respond_with Album.find(params[:id]), page: page
  end
end
