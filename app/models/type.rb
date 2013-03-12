class Type < ActiveRecord::Base
  attr_accessible :description, :name

  # validation
  validates_presence_of :name

  ####################
  # instance methods #
  ####################
  def self.mudi
    @mudi ||= Type.find_by_name I18n.t("type.mudi")
  end

  def self.lvhua
    @lvhua ||= Type.find_by_name I18n.t("type.lvhua")
  end

  def self.gonglu
    @gonglu ||= Type.find_by_name I18n.t("type.gonglu")
  end
end
