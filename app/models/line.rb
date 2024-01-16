class Line < ApplicationRecord
  has_one :train
  has_many :offers
end
