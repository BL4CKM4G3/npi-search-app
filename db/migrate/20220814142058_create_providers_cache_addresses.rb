class CreateProvidersCacheAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :country_code
      t.string :country_name
      t.string :city
      t.string :address_purpose
      t.string :address_type
      t.string :address_1
      t.string :state

      t.timestamps
    end
  end
end
