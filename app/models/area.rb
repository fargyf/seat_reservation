class Area < ActiveRecord::Base
  attr_accessible :description, :name, :x_max, :y_max
  has_many :seats, :dependent => :destroy

  ##############
  # validation #
  ##############
  validates_presence_of :name, :x_max, :y_max
  validates_numericality_of :x_max, :y_max, :only_integer => true

  # callback functions
  after_save :create_steats_by_x_max_and_y_max
  def create_steats_by_x_max_and_y_max
    self.create_default_seats
  end
  private :create_steats_by_x_max_and_y_max

  ####################
  # instance methods #
  ####################
  def create_default_seats
    (x_max * y_max).times{ |n| seats.create!([{:type=> Type.mudi, :name => "seat_#{n + 1}", :state => State.keshou}])}
  end
end
