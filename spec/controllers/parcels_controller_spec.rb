require 'rails_helper'

RSpec.describe ParcelsController, type: :controller do
  describe 'GET #index' do
    context 'when parcel owner is present and has parcels' do
      it 'returns a success response with parcels' do
        parcel_owner = FactoryBot.create(:parcel_owner)
        parcels = create_list(:parcel, 2, parcel_owner: parcel_owner)
        get :index, params: { parcel_owner_id: parcel_owner.id }
        expect(response).to have_http_status(:success)
      end
    end

    context 'when parcel owner is present but has no parcels' do
      it 'returns an empty response' do
        parcel_owner = FactoryBot.create(:parcel_owner)
        get :index, params: { parcel_owner_id: parcel_owner.id }
        expect(response).to have_http_status(:success)
      end
    end

    context 'when parcel owner is not found' do
      it 'returns a message parcel not found' do
        get :index, params: { parcel_owner_id: 999 }
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)).to eq({ 'message' => 'Parcel not found' })
      end
    end
  end
end
