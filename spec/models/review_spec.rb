# frozen_string_literal: true

RSpec.describe Review do
  it 'should has proper validations set' do
    should validate_presence_of(:aroma_score)
    should validate_presence_of(:appearance_score)
    should validate_presence_of(:flavor_score)
    should validate_presence_of(:mouthfeel_score)
    should validate_presence_of(:overall_score)
    should validate_presence_of(:total_score)

    should validate_numericality_of(:aroma_score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(12)
    should validate_numericality_of(:appearance_score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(3)
    should validate_numericality_of(:flavor_score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(20)
    should validate_numericality_of(:mouthfeel_score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(5)
    should validate_numericality_of(:overall_score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(10)
    should validate_numericality_of(:total_score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(50)
    should validate_numericality_of(:stylistic_accuracy).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(5)
    should validate_numericality_of(:technical_merit).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(5)
    should validate_numericality_of(:intangibles).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(5)
  end

  it 'should has proper relations set' do
    should belong_to(:beer)
  end

  it 'should has valid factories' do
    beer = build(:beer)
    expect(build(:review, beer: beer)).to be_valid
    expect(build(:review, :with_beer)).to be_valid
  end
end
