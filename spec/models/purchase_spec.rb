require 'rails_helper'

RSpec.describe Purchase, type: :model do
  context 'with valid attributes' do
    it { expect(build(:purchase)).to be_valid }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:item) }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:name).to(:item).with_prefix }
  end
end
