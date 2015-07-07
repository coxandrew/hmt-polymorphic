class AlbumItem < ActiveRecord::Base
  belongs_to :album
  belongs_to :albumable, polymorphic: true

  acts_as_list scope: :album
end
