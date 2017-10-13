# frozen_string_literal: true

FactoryGirl.define do
  factory :beer do
    name { Faker::Beer.unique.name }
    brewery { Faker::Company.name }
    country { Faker::Address.country_code }
    style { Faker::Beer.style }
    international_bitterness_unit { Faker::Number.between(1, 150) }
    alcohol_by_volume { Faker::Number.decimal(2, 1) }
    original_gravity { rand(10.0..30.0) }
    final_gravity { rand(1.0..9.0) }

    trait :with_ingredients do
      transient do
        malts_count { rand(1..3) }
        yeasts_count { rand(1..2) }
        hops_count { rand(1..5) }
        specials_count { rand(0..2) }
      end

      malts { Array.new(malts_count) { |i| Faker::Beer.malt }.join(', ') }
      yeasts { Array.new(yeasts_count) { |i| Faker::Beer.yeast }.join(', ') }
      hops { Array.new(hops_count) { |i| Faker::Beer.hop }.join(', ') }
      special_ingredients { Array.new(specials_count) { |i| Faker::Food.spice }.join(', ') }
    end
  end
end
