require 'rails_helper'

RSpec.describe Profile, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.create(:profile)).to be_valid
  end

  context 'associations' do
    it { should belong_to(:user) }
  end
end
