require 'rails_helper'

RSpec.describe 'Api::Internal::ReviewsControllers', type: :request do
  let(:item) { create(:item) }
  let(:user) { create(:user) }

  describe 'POST /create' do
    let(:params) do
      {
        review: {
          user_id: user.id,
          item_id: item.id,
          body: "MyString",
          rating: 1
        }
      }
    end

    let(:attributes) do
      JSON.parse(response.body)['review'].symbolize_keys
    end

    def perform
      post '/api/internal/reviews', params: params
    end

    context 'with authorized user' do
      before do
        sign_in(user)
        perform
      end

      it 'creates a review' do
        expect(Review.count).to eq(1)
      end

      it { expect(attributes).to include(params[:review]) }
      it { expect(response.status).to eq(201) }
    end

    context 'with unauthorized user' do
      before do
        perform
      end

      it { expect(response.status).to eq(401) }
    end
  end
end
