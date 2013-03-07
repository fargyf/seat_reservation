class Type < ActiveRecord::Base
  attr_accessible :description, :name

  # validation
  validates_presence_of :name
end
