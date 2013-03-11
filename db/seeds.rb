# encoding:utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Type.delete_all
Type.create! [
  {:name => I18n.t('type.mudi')},
  {:name => I18n.t('type.lvhua')},
  {:name => I18n.t('type.gonglu')},
]

State.delete_all
State.create! [
  {:name => I18n.t('state.bukeshou')},
  {:name => I18n.t('state.keshou')},
  {:name => I18n.t('state.yuding')},
  {:name => I18n.t('state.qiatan')},
  {:name => I18n.t('state.shigong')},
  {:name => I18n.t('state.yanshou')},
  {:name => I18n.t('state.tongzhikehu')},
  {:name => I18n.t('state.jieshu')},
]
