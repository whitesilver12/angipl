require 'rails_helper'

RSpec.describe Word, type: :model do
  describe "columns" do
    it { is_expected.to have_db_column(:value)}
    it { is_expected.to have_db_column(:language)}
  end

  describe "validation" do
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:language) }
  end
  
  
end
