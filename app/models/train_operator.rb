class TrainOperator < ApplicationRecord
  has_many :trains
  has_many :offers
end
