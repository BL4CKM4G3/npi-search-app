FactoryBot.define do
  factory :provider_cache, class: 'ProviderCache' do
    npi_number { Faker::Number.number(digits: 10).to_s }
    name { Faker::Games::Zelda.character }
    status { ['A', 'I'].sample }
    enumeration_type { [0, 1].sample }
    credential { ['M.D', 'P.T'].sample }
    last_updated { 15.days.ago }
    registered_at { [1.days.ago, 2.days.ago].sample }

    trait :with_full_setup do
      after(:create) { |provider| create_list(:address, 3, provider_cache: provider) }
      after(:create) { |provider| create_list(:taxonomy, 3, provider_cache: provider) }
    end
  end
end