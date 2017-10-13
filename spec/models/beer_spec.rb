# frozen_string_literal: true

RSpec.describe Beer do
  describe 'validations' do
    it 'should has proper validations set' do
      should validate_presence_of(:name)
      should validate_presence_of(:brewery)
      should validate_presence_of(:style)
      should validate_numericality_of(:international_bitterness_unit).only_integer.is_greater_than_or_equal_to(0)
      should validate_numericality_of(:alcohol_by_volume).is_greater_than_or_equal_to(0)
      should validate_numericality_of(:original_gravity).is_greater_than_or_equal_to(0)
      should validate_numericality_of(:final_gravity).is_greater_than_or_equal_to(0)
      should validate_length_of(:country).is_equal_to(2)
    end

    it 'should validate gravity difference' do
      expect(build(:beer, original_gravity: 15, final_gravity: 5)).to be_valid
      expect(build(:beer, original_gravity: 15, final_gravity: 15)).to be_valid
      expect(build(:beer, original_gravity: 15, final_gravity: 17)).not_to be_valid
    end
  end

  it 'should has proper relations set' do
    should have_many(:reviews)
  end

  it 'should has valid factories' do
    expect(build(:beer)).to be_valid
    expect(build(:beer, :with_ingredients)).to be_valid
  end
end
