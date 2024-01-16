class TrainUnavailableWorker
  include Sidekiq::Worker
  def perform(train_id)
    train = Train.find_by(id: train_id)
    return unless train.present?

    update_train_status(train)
  end

  private

  def update_train_status(train)
    train.update(status: true)
  end
end
