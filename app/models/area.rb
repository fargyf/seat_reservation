class Area < ActiveRecord::Base
  attr_accessible :description, :name, :x_max, :y_max
  has_many :seats, :dependent => :destroy

  ##############
  # validation #
  ##############
  validates_presence_of :name, :x_max, :y_max
  validates_numericality_of :x_max, :y_max, :only_integer => true
end
