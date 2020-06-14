class Dday < ApplicationRecord
    belongs_to :event
    has_many :users, dependent: :destroy
end
