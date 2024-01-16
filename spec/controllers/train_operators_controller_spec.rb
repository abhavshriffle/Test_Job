require 'rails_helper'

RSpec.describe TrainOperatorsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      trains = FactoryBot.create_list(:train, 3)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #available_trains' do
    context 'when there are available trains' do
      it 'returns a success response with available trains' do
        available_trains = FactoryBot.create_list(:train, 3, status: true)
        get :available_trains
        expect(response).to have_http_status(:success)
      end
    end

    context 'when there are no available trains' do
      it 'returns an empty response' do
        get :available_trains
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)).to be_empty
      end
    end

    context 'when an error occurs' do
      it 'returns an error response' do
        allow(Train).to receive(:where).and_raise(StandardError.new('Custom error'))
        get :available_trains
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to eq({ 'error' => 'Custom error' })
      end
    end
  end
end
