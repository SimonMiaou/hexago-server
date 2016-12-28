FactoryGirl.define do
  factory :game do
    board_size { rand(8) + 3 }
    number_of_players { rand(5) + 2 }
  end
end
