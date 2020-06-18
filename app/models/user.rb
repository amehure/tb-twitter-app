class User < ApplicationRecord
    belongs_to :dday
    validates :serial_no, uniqueness: true
    with_options presence: true do
        validates :event_no
        validates :event_sub_no
        validates :serial_no
        validates :twitter_screenname
    end
end
