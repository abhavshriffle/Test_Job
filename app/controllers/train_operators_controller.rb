class TrainOperatorsController < ApplicationController
  def index
    @train = Train.all
    render json: @train
  end

  def available_trains
    @available_trains = Train.where(status: true)
    render json: @available_trains
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
