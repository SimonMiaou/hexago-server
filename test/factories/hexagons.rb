FactoryGirl.define do
  factory :hexagon do
    x { rand(10) }
    y { rand(10) }

    association :game
  end
end
