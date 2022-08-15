require 'rails_helper'
require 'npi_registry/npi_search'

RSpec.describe NPISearch, type: :lib do
  context 'search_provider' do
    it 'external API returns a error' do
      number = '0000000000'
      message = 'Some errors occurred on the request. <h1>Server Error (500)</h1>.'

      expect { search_provider number }.to raise_error message 
    end

    it 'external API returns a invalid search criteria error' do
      number = ''
      message = 'Some errors occurred on the request. No valid search criteria provided.'
      
      expect { search_provider number }.to raise_error message
    end

    it 'no providers found | 404' do
      number = '1234567890'
      message = "Provider not found."

      expect { search_provider number }.to raise_error message
    end

    it 'founds a provider' do
      valid_npi = '1689665960'

      npi = search_provider valid_npi

      expect(npi[:npi_number]).to eq(valid_npi)
      expect(npi[:name]).to eq('SAVA JACK')
      expect(npi[:status]).to eq('A')
      expect(npi[:enumeration_type]).to eq('NPI-1')
      expect(npi[:credential]).to eq('MD')
    end
  end

  private

  def search_provider(number)
    described_class.new(number: number).import_data
  end
end