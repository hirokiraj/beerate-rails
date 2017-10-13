# frozen_string_literal: true

FactoryGirl.define do
  factory :review do
    aroma { Faker::Lorem.paragraph }
    appearance { Faker::Lorem.paragraph }
    flavor { Faker::Lorem.paragraph }
    mouthfeel { Faker::Lorem.paragraph }
    overall { Faker::Lorem.paragraph }

    aroma_score { Faker::Number.between(0, 12) }
    appearance_score { Faker::Number.between(0, 3) }
    flavor_score { Faker::Number.between(0, 20) }
    mouthfeel_score { Faker::Number.between(0, 5) }
    overall_score { Faker::Number.between(0, 10) }
    total_score { Faker::Number.between(0, 50) }

    stylistic_accuracy { Faker::Number.between(1, 5) }
    technical_merit { Faker::Number.between(1, 5) }
    intangibles { Faker::Number.between(1, 5) }

    # Give each and every of them around 5% chance to be true
    acetaldehyde { Random.rand(100) % 20 == 0 ? true : false }
    alcoholic { Random.rand(100) % 20 == 0 ? true : false }
    astringent { Random.rand(100) % 20 == 0 ? true : false }
    diacetyl { Random.rand(100) % 20 == 0 ? true : false }
    dms { Random.rand(100) % 20 == 0 ? true : false }
    estery { Random.rand(100) % 20 == 0 ? true : false }
    grassy { Random.rand(100) % 20 == 0 ? true : false }
    light_struck { Random.rand(100) % 20 == 0 ? true : false }
    metallic { Random.rand(100) % 20 == 0 ? true : false }
    musty { Random.rand(100) % 20 == 0 ? true : false }
    oxidized { Random.rand(100) % 20 == 0 ? true : false }
    phenolic { Random.rand(100) % 20 == 0 ? true : false }
    solvent { Random.rand(100) % 20 == 0 ? true : false }
    sour_acidic { Random.rand(100) % 20 == 0 ? true : false }
    sulfur { Random.rand(100) % 20 == 0 ? true : false }
    vegetal { Random.rand(100) % 20 == 0 ? true : false }
    yeasty { Random.rand(100) % 20 == 0 ? true : false }

    trait :with_beer do
      beer
    end
  end
end
