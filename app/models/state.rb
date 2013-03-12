class State < ActiveRecord::Base
  attr_accessible :description, :name

  # validation
  validates_presence_of :name

  ####################
  # instance methods #
  ####################
  def self.bukeshou
    @bukeshou ||= State.find_by_name I18n.t("state.bukeshou")
  end

  def self.keshou
    @keshou ||= State.find_by_name I18n.t("state.keshou")
  end

  def self.yuding
    @yuding ||= State.find_by_name I18n.t("state.yuding")
  end

  def self.qiatan
    @qiatan ||= State.find_by_name I18n.t("state.qiatan")
  end

  def self.shigong
    @shigong ||= State.find_by_name I18n.t("state.shigong")
  end

  def self.yanshou
    @yanshou ||= State.find_by_name I18n.t("state.yanshou")
  end

  def self.tongzhikehu
    @tongzhikehu ||= State.find_by_name I18n.t("state.tongzhikehu")
  end

  def self.jieshu
    @jieshu ||= State.find_by_name I18n.t("state.jieshu")
  end
end
