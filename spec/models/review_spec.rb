require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'with valid attributes' do
    it { expect(build(:review)).to be_valid }
  end
end
