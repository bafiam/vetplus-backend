require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.create(:appointment)).to be_valid
  end

  context 'associations' do
    it { should belong_to(:vet) }
    it { should belong_to(:profile) }
    
  end
end
