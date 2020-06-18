class Dday < ApplicationRecord
    belongs_to :event
    has_many :users, dependent: :destroy
    validates :event_sub_no, uniqueness: true
    with_options presence: true do
        validates :event_no
        validates :event_sub_no
        validates :event_date
        validates :max_num
    end
end
