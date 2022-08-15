class CreateProviderCaches < ActiveRecord::Migration[7.0]
  def change
    create_table :provider_caches do |t|
      t.string :npi_number
      t.string :name
      t.string :status
      t.integer :enumeration_type
      t.string :credential
      t.datetime :last_updated
      t.datetime :registered_at

      t.timestamps
    end
  end
end
