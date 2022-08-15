require 'rails_helper'

RSpec.describe Taxonomy, type: :model do
  context "fields" do
    it { should have_db_column(:code).of_type(:string) }
    it { should have_db_column(:desc).of_type(:string) }
    it { should have_db_column(:primary).of_type(:boolean) }
    it { should have_db_column(:state).of_type(:string) }
    it { should have_db_column(:license).of_type(:string) }
  end

  context "associations" do
    it { should belong_to(:provider_cache) }
  end
end
