class ProviderCache < ApplicationRecord
  validates :npi_number, presence: true, uniqueness: { case_sensitive: false }

  has_many :addresses, class_name: 'Address'
  has_many :taxonomies, class_name: 'Taxonomy'

  accepts_nested_attributes_for :addresses, :taxonomies
  
  enum enumeration_type: { 'NPI-1': 0, 'NPI-2': 1 }

  def main_address
    addresses.find_by(address_purpose: 'LOCATION')
  end

  def main_taxonomy
    taxonomies.find_by(primary: true)
  end
end
