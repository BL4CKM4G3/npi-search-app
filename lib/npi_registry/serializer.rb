module NpiRegistry
  module Serializer
    def translate_provider_data(data)
      data.map do |record|
        {
          npi_number: record['number'].to_s,
          name: record['basic']['name'],
          status: record['basic']['status'],
          enumeration_type: record['enumeration_type'],
          credential: record['basic']['credential'].to_s,
          registered_at: Time.at(record['created_epoch']).to_datetime,
          last_updated: Time.at(record['last_updated_epoch']).to_datetime,
          addresses_attributes: translate_address_data(record['addresses']),
          taxonomies_attributes: translate_taxonomy_data(record['taxonomies'])
        }
      end
    end

    def translate_address_data(data)
      data.map do |record|
        {
          country_code: record['country_code'],
          country_name: record['country_name'],
          address_purpose: record['address_purpose'],
          address_type: record['address_type'],
          address_1: record['address_1'],
          city: record['city'],
          state: record['state']
        }
      end
    end
    
    def translate_taxonomy_data(data)
      data.map do |record|
        {
          code: record['code'],
          desc: record['desc'],
          primary: record['primary'],
          state: record['state'],
          license: record['license']
        }
      end
    end
  end
end