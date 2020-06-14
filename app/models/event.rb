class Event < ApplicationRecord
    has_many :ddays, dependent: :destroy
end
