# frozen_string_literal: true

RSpec.describe Review do
  it 'has proper validations set' do
    should validate_presence_of(:aroma_score)
    should validate_presence_of(:look_score)
    should validate_presence_of(:taste_score)
    should validate_presence_of(:bitterness_score)
    should validate_presence_of(:mouthfeel_score)
    should validate_presence_of(:total_score)

    should validate_numericality_of(:aroma_score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(14)
    should validate_numericality_of(:look_score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(6)
    should validate_numericality_of(:taste_score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(18)
    should validate_numericality_of(:bitterness_score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(6)
    should validate_numericality_of(:mouthfeel_score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(6)
    should validate_numericality_of(:total_score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(50)
  end

  it 'has proper relations set' do
    should belong_to(:beer)
  end
end
