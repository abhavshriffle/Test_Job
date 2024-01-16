class Train < ApplicationRecord
  belongs_to :train_operator, optional: true
  belongs_to :line, optional: true
  has_many :bookings

  delegate :name, to: :line, prefix: true, allow_nil: true
end
