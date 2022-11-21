require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'with valid attributes' do
    it { expect(build(:item)).to be_valid }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  end
end
