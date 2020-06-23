FactoryBot.define do
    factory :event do
        id { 1 }
        event_name { "TEST_NAME" }
        contents { "TEST_CONTENTS" }
        deadline{ Time.local(2020,6,15,12,30,0) }
        organizar { "TEST_ORGANIZAR" }
        event_no { "TEST_NO" }
        multiple_entries{ true }

        after(:create) do |event|
            create(:dday, event: event)
        end
    end

    factory :dday do
        sequence(:id) { |n| n }
        event_no { "TEST_NO" }
        event_sub_no { 1 }
        event_date { Time.local(2020,6,15,12,30,0) }
        sequence(:decision) { |n| "TEST_DESCISION#{n}"}
        max_num { 5 }
        sequence(:zoom_url) { |n| "TEST_ZOOM_URL#{n}"}
        sequence(:zoom_id) { |n| "TEST_ZOOM_ID#{n}"}
        sequence(:zoom_pass) { |n| "TEST_ZOOM_PASS#{n}"}
    
        trait :with_event do
            event
        end
        after(:create) do |dday|
            create(:user, dday: dday)
        end
    end

    factory :user do
        sequence(:id) { |n| n }
        event_no { "TEST_NO" }
        event_sub_no { 1 }
        sequence(:serial_no) { |n| n }
        sequence(:twitter_screenname) { |n| "TEST_SCRENNNAME#{n}"}
    end
end