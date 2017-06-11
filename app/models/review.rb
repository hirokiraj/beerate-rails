# frozen_string_literal: true

class Review < ActiveRecord::Base
  belongs_to :beer

  validates :beer, :aroma_score, :look_score, :taste_score, :bitterness_score, :mouthfeel_score, :total_score, presence: true
  validates :aroma_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 14 }
  validates :look_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 6 }
  validates :taste_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 18 }
  validates :bitterness_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 6 }
  validates :mouthfeel_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 6 }
  validates :total_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 50 }
end
