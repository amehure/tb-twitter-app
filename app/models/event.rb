class Event < ApplicationRecord
    has_many :ddays, dependent: :destroy
    validates :event_no, uniqueness: true
    with_options presence: true do
        validates :event_no
        validates :event_name
        validates :organizar
        validates :deadline
        validates :multiple_entries
    end
end
