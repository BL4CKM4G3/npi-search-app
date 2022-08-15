FactoryBot.define do
  factory :address, class: 'Address' do
    country_code { Faker::Address.country  }
    country_name { Faker::Address.country_code  }
    city { ['A', 'I'].sample }
    address_purpose { ['LOCATION'].sample }
    address_type { ['DOM', 'MAILING'].sample }
    address_1 { Faker::Address.street_address }
    state { Faker::Address.state_abbr  }

    provider_cache
  end
end