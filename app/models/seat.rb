class Seat < ActiveRecord::Base
  attr_accessible :customer_id, :name, :position, :x_position, :y_position, :area_id, :type_id, :state_id, :type, :state

  # association
  belongs_to :area
  belongs_to :type
  belongs_to :state
  acts_as_restful_list :scope => :area

  # validation
  validates_presence_of :name

  # callback functions
  after_save :update_x_position_and_y_position
  def update_x_position_and_y_position
    self.x_position = (position / area.x_max) + 1
    self.y_position = position % area.x_max
  end
  private :update_x_position_and_y_position
end
