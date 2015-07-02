class Vehicle < ActiveRecord::Base
  has_many :assignments, as: :target
  has_many :tasks, through: :assignments
end
