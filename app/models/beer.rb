# frozen_string_literal: true

class Beer < ActiveRecord::Base
  has_many :reviews

  validates :name, :brewery, :style, presence: true
  validates :international_bitterness_unit, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0 
  }, allow_blank: true
  validates :alcohol_by_volume, :original_gravity, :final_gravity, numericality: {
    greater_than_or_equal_to: 0
  }, allow_blank: true
  validates :country, length: { is: 2 }, allow_blank: true
  validate :gravity_difference

  private

  def gravity_difference
    if final_gravity && original_gravity && (final_gravity > original_gravity)
      errors.add(:original_gravity, 'must be greater than final gravity')
    end
  end
end
