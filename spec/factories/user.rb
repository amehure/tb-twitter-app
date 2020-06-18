FactoryBot.define do
    factory :user do
        sequence(:id) { |n| n }
        sequence(:event_no) { |n| "TEST_NO#{n}"}
        sequence(:event_sub_no) { |n| n }
        sequence(:serial_no) { |n| n }
        sequence(:twitter_screenname) { |n| "TEST_SCRENNNAME#{n}"}
        sequence(:dday_id) { |n| n }
        dday
    end
    factory :dday do
        sequence(:id) { |n| n }
        sequence(:event_no) { |n| "TEST_NO#{n}"}
        sequence(:event_sub_no) { |n| n }
        event_date { Time.local(2020,6,15,12,30,0) }
        sequence(:decision) { |n| "TEST_DESCISION#{n}"}
        sequence(:max_num) { |n| n }
        sequence(:zoom_url) { |n| "TEST_ZOOM_URL#{n}"}
        sequence(:zoom_id) { |n| "TEST_ZOOM_ID#{n}"}
        sequence(:zoom_pass) { |n| "TEST_ZOOM_PASS#{n}"}
        sequence(:event_id) { |n| n }
        event
    end
    factory :event do
        sequence(:id) { |n| n }
        sequence(:event_name) { |n| "TEST_NAME#{n}"}
        sequence(:contents) { |n| "TEST_CONTENTS#{n}"}
        deadline{ Time.local(2020,6,15,12,30,0) }
        sequence(:organizar) { |n| "TEST_ORGANIZAR#{n}"}
        sequence(:event_no) { |n| "TEST_NO#{n}" }
        multiple_entries{ true }
    end
end