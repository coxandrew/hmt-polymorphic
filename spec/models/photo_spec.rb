require 'rails_helper'

RSpec.describe Photo, :type => :model do
  let(:album) { Album.create(title: "Alpha") }
  let(:album2) { Album.create(title: "Beta") }
  let(:photo) { Photo.create(name: "Photo1") }

  it "can belong to multiple albums" do
    album.photos << photo
    album2.photos << photo
    expect(photo.albums.count).to eq 2
  end
end
