require 'rails_helper'

RSpec.describe Album, :type => :model do
  let(:album) { Album.create(title: "Alpha") }
  let(:photo) { Photo.create(name: "Photo1") }
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

  it "returns albumables ordered by position" do

  end

  it "adds items to the end with a unique position"
end
