require 'rails_helper'

RSpec.describe ProviderCache, type: :model do
  context "fields" do
    it { should have_db_column(:npi_number).of_type(:string) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:status).of_type(:string) }
    it { should have_db_column(:enumeration_type).of_type(:integer) }
    it { should have_db_column(:credential).of_type(:string) }
    it { should have_db_column(:registered_at).of_type(:datetime) }
    it { should have_db_column(:last_updated).of_type(:datetime) }
  end

  context "validations" do
    it { should validate_presence_of :npi_number }
    it { should validate_uniqueness_of(:npi_number).case_insensitive }
  end

  context "associations" do
    it { should have_many(:addresses).class_name 'Address' }
    it { should have_many(:taxonomies).class_name 'Taxonomy' }
  end
end
