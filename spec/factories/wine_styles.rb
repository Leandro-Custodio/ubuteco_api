FactoryBot.define do
  factory :wine_style do
    sequence(:name) { |n| n }
    user
  end
end
