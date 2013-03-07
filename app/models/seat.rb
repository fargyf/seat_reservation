class Seat < ActiveRecord::Base
  belongs_to :area
  belongs_to :type
  belongs_to :state
  attr_accessible :customer_id, :name, :position, :x_position, :y_position, :area_id, :type_id, :state_id

  # validation
  validates_presence_of :name
end
