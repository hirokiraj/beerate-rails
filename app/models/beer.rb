# frozen_string_literal: true

class Beer < ActiveRecord::Base
  validates :name, :brewery, :style, :country, presence: true
  validates :international_bitterness_unit, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validates :alcohol_by_volume, :original_gravity, numericality: {
    greater_than_or_equal_to: 0
  }
  validates :country, length: { is: 2 }
end
