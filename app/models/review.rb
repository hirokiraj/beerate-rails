# frozen_string_literal: true

class Review < ActiveRecord::Base
  belongs_to :beer

  validates :beer, :aroma_score, :appearance_score, :flavor_score, :mouthfeel_score,
    :overall_score, :total_score, :stylistic_accuracy, :technical_merit,
    :intangibles, presence: true
  validates :aroma_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 12 }
  validates :appearance_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3 }
  validates :flavor_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  validates :mouthfeel_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :overall_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :total_score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 50 }
  validates :stylistic_accuracy, :technical_merit, :intangibles, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
end
