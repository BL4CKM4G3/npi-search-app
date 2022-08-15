require 'rails_helper'

RSpec.describe Address, type: :model do
  context "fields" do
    it { should have_db_column(:country_code).of_type(:string) }
    it { should have_db_column(:country_name).of_type(:string) }
    it { should have_db_column(:city).of_type(:string) }
    it { should have_db_column(:address_purpose).of_type(:string) }
    it { should have_db_column(:address_type).of_type(:string) }
    it { should have_db_column(:address_1).of_type(:string) }
    it { should have_db_column(:state).of_type(:string) }
  end

  context "associations" do
    it { should belong_to(:provider_cache).class_name 'ProviderCache' }
  end
end
