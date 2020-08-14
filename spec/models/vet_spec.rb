require 'rails_helper'

RSpec.describe Vet, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.create(:vet)).to be_valid
  end

  context 'associations' do
    it { should belong_to(:user) }
    
  end
end
