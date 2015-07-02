class Task < ActiveRecord::Base
  has_many :assignments
  has_many :targets, through: :assignments, source_type: "Target"
end
