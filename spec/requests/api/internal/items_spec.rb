require 'rails_helper'

RSpec.describe 'Api::Internal::ItemsControllers', type: :request do
  describe 'GET /index' do
    let!(:items) { create_list(:item, 5) }
    let(:collection) { JSON.parse(response.body)['items'] }
    let(:params) { {} }

    def perform
      get '/api/internal/items', params: params
    end

    before do
      perform
    end

    it { expect(collection.count).to eq(5) }
    it { expect(response.status).to eq(200) }
  end

  describe 'GET /show' do
    let(:item) { create(:item) }
    let(:item_id) { item.id.to_s }

    let(:attributes) do
      JSON.parse(response.body)['item'].symbolize_keys
    end

    def perform
      get "/api/internal/items/#{item_id}"
    end

    before do
      perform
    end

    it { expect(response.status).to eq(200) }

    context 'with resource not found' do
      let(:item_id) { '666' }

      it { expect(response.status).to eq(404) }
    end
  end
end
