json.record do 
  json.npi_number provider.npi_number
  json.name provider.name
  json.status provider.status
  json.type provider.enumeration_type
  json.credential provider.credential
  json.address provider.main_address.address_1
  json.taxonomy do |taxonomy|
    json.desc provider.main_taxonomy.desc
    json.code provider.main_taxonomy.code
  end
end