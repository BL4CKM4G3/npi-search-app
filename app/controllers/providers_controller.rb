class ProvidersController < ApplicationController
  def search
    @providers = ProviderCache.all
  end
end
