require 'npi_registry/npi_search'

class ProvidersController < ApplicationController
  before_action :load_cache, only: [:index]
  
  rescue_from RuntimeError do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def index
  end

  def search
    provider_attrs = import_provider search_params['search_number']
    
    @provider = ProviderCache.new(provider_attrs)

    respond_to do |format|
      if @provider.save
        format.json {
          render partial: 'search', 
          status: :created, 
          locals: {
            provider: @provider
          } 
        }
      else
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
  def load_cache
    @providers = ProviderCache.all
  end

  def search_params
    params.permit(:search_number)
  end

  def import_provider(npi_number)
    NPISearch.new(number: npi_number).import_data
  end
end
