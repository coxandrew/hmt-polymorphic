require 'rails_helper'

RSpec.describe Album, :type => :model do
  let(:album) { Album.create(title: "Alpha") }
  let(:album2) { Album.create(title: "Beta") }
  let(:photo) { Photo.create(name: "Photo1") }
  let(:photo2) { Photo.create(name: "Photo2") }
  let(:document) { Document.create(name: "Doc1") }

  it "can contain photos" do
    album.photos << photo
    expect(album.photos.count).to eq 1
    expect(album.album_items.count).to eq 1
  end

  it "can contain documents" do
    album.documents << document
    expect(album.documents.count).to eq 1
    expect(album.album_items.count).to eq 1
  end

  it "can contain albums" do
    album.albums << album2
    expect(album.albums.count).to eq 1
    expect(album.album_items.count).to eq 1
  end

  it "returns albumables ordered by position" do
    album.photos << Photo.create(name: "photo-2")
    album.documents << Document.create(name: "doc-1")
    album.albums << Album.create(title: "album-1")
    album.photos << Photo.create(name: "photo-1")

    expect(album.album_items[2].albumable_type).to eq "Album"
    expect(album.album_items.pluck(:position)).to eq [1, 2, 3, 4]
  end

  it "adds new album_item objects to the end of the list" do
    album.photos << Photo.create(name: "photo-2")
    album.documents << Document.create(name: "doc-1")
    album_item = AlbumItem.new(albumable_id: photo.id, albumable_type: "Photo")
    album.album_items << album_item
    expect(album_item.album_id).to eq album.id
    expect(album_item.position).to eq 3
  end
end
