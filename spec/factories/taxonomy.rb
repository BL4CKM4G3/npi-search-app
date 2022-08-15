FactoryBot.define do
  factory :taxonomy, class: 'Taxonomy' do
    code { Faker::Internet.password(min_length: 10, max_length: 10).upcase }
    desc { ['Densist', 'Internal Medicine'].sample }
    primary { [true, false].sample }
    state { Faker::Address.state_abbr }
    license { ['M.D', 'P.T'].sample }

    provider_cache
  end
end