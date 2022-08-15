class AddRelationshipsToProvidersAdressesAndTaxonomies < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :provider_cache, references: :provider_caches, index: true
    add_reference :taxonomies, :provider_cache, references: :provider_caches, index: true
  end
end
