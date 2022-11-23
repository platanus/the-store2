require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with valid attributes' do
    it { expect(build(:user)).to be_valid }
  end

  describe 'associations' do
    it { is_expected.to have_many(:purchases) }
  end
end
