require 'rails_helper'

RSpec.describe 'Providers', type: :request do
  context '/index' do
    it 'populates array of providers' do
      1..3.times do |i|
        FactoryBot.create :provider_cache, :with_full_setup
      end

      get root_path

      expect(response).to have_http_status :ok
      expect(response).to render_template :index
    end
  end

  context ' /search' do
      context 'invalid results' do
        it 'npi digits are blank' do
          search_query = ''
          message = 'Some errors occurred on the request. No valid search criteria provided.'
          params = { search_number: search_query }

          get '/providers/search', params: params

          expect(response.body).to include message
        end
        
        it 'no provider found' do
          search_query = '1234567890'
          message = "Provider not found."
          params = { search_number: search_query }
          
          get '/providers/search', params: params
          
          expect(response.body).to include message
        end
        
        it 'invalid npi number' do
          search_query = 'dada123123'
          message = 'Some errors occurred on the request. Field contains special character(s) or wrong number of characters.'
          params = { search_number: search_query }

          get '/providers/search', params: params

          expect(response.body).to include message
        end
      end

      context 'valid results' do
        it 'import provider data' do
          search_query = '1689665960'
          params = { search_number: search_query }

          expect { get '/providers/search.json', params: params }.to change(ProviderCache, :count).by(1)

          expect(JSON.parse(response.body)['record']['npi_number']).to eq search_query
          expect(ProviderCache.last.npi_number).to eq search_query
      end
    end
  end
end
