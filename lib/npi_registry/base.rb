require 'faraday'

class Base
  API_VERSION = "2.0"
  BASE_URL = "https://npiregistry.cms.hhs.gov/api/"

  def connect(params)
    url = "#{BASE_URL}?version=#{API_VERSION}" + params

    Faraday.get url
  end

  def parsed_response(response)
    JSON.parse response.body
  end

  def has_errors?(response)
    error_occurred = response.status != 200

    errors = error_occurred ? response.body : parsed_response(response)['Errors']
    return unless errors 

    messages = error_occurred ? errors : errors.pluck('description').join(' ')

    raise "Some errors occurred on the request. #{messages}."
  end
end