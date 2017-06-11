# frozen_string_literal: true

RSpec.describe Beer do
  it 'has proper validations set' do
    should validate_presence_of(:name)
    should validate_presence_of(:brewery)
    should validate_presence_of(:country)
    should validate_presence_of(:style)
    should validate_numericality_of(:international_bitterness_unit).only_integer.is_greater_than_or_equal_to(0)
    should validate_numericality_of(:alcohol_by_volume).is_greater_than_or_equal_to(0)
    should validate_numericality_of(:original_gravity).is_greater_than_or_equal_to(0)
    should validate_length_of(:country).is_equal_to(2)
  end

  it 'has proper relations set' do
    should have_many(:reviews)
  end
end
