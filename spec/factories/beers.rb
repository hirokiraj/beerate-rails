# frozen_string_literal: true

FactoryGirl.define do
  factory :beer do
    name Faker::Beer.name
    brewery Faker::Company.name
    country Faker::Address.country_code
    style Faker::Beer.style
    international_bitterness_unit Faker::Number.between(1, 150)
    alcohol_by_volume Faker::Number.decimal(2, 1)
    original_gravity Faker::Number.decimal(2, 1)
  end
end
