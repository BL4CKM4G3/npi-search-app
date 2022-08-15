require 'npi_registry/base'
require 'npi_registry/serializer'

class NPISearch < Base
  include NpiRegistry::Serializer

  def initialize(number:)
    @npi_number = number
  end

  def import_data
    response = request_npi

    # Error treatment
    has_errors? response

    response_data = parsed_response response

    raise "Provider not found." unless response_data['result_count'].nonzero?

    translate_provider_data(response_data['results']).first
  end

  private

  def request_npi
    query_number = "&number=#{@npi_number}"
    
    self.connect query_number
  end
end