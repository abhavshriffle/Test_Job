class ParcelsController < ApplicationController
  def index
    @parcel_owner = ParcelOwner.find_by(id: params[:parcel_owner_id])
    if @parcel_owner.present? && @parcel_owner.parcels
      render json: @parcel_owner.parcels
    else
      render json: { message: 'Parcel not found' }
    end
  end
end
