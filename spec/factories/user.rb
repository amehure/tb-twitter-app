# FactoryBot.define do
#     factory :user do
#         sequence(:id) { |n| n }
#         sequence(:event_no) { |n| "TEST_NO#{n}"}
#         sequence(:event_sub_no) { |n| n }
#         sequence(:serial_no) { |n| n }
#         sequence(:twitter_screenname) { |n| "TEST_SCRENNNAME#{n}"}
#         sequence(:dday_id) { |n| n }
#         association :dday, factory: :dday, event_sub_no: 1, event_no: "TEST_NO01"
#         trait :attributes_user do
#             sequence(:id) { |n| n + 1  }
#             sequence(:event_no) { |n| "AttributesNO01#{n + 1 }"}
#             sequence(:event_name) { |n| "TEST_NAME#{n + 1 }"}
#             sequence(:contents) { |n| "TEST_CONTENTS#{n + 1 }"}
#             deadline{ Time.local(2020,6,15,12,30,0) }
#             sequence(:organizar) { |n| "TEST_ORGANIZAR#{n + 1 }"}
#             association :dday, factory: :dday, event_sub_no: 2, event_no: "TEST_NO02"
#         end
#         # after(:create) do |user|
#         #     create_list(:dday, 3, users: user)
#         # end
#         # dday
#     end
#     factory :dday do
#         sequence(:id) { |n| n }
#         # sequence(:event_no) { |n| "TEST_NO#{n}"}
#         # sequence(:event_sub_no) { |n| n }
#         event_date { Time.local(2020,6,15,12,30,0) }
#         sequence(:decision) { |n| "TEST_DESCISION#{n}"}
#         sequence(:max_num) { 5 }
#         sequence(:zoom_url) { |n| "TEST_ZOOM_URL#{n}"}
#         sequence(:zoom_id) { |n| "TEST_ZOOM_ID#{n}"}
#         sequence(:zoom_pass) { |n| "TEST_ZOOM_PASS#{n}"}
#         sequence(:event_id) { |n| n }
#         association :event, factory: :event, id: 1, event_no: "TEST_NO01"
#         # after(:create) do |dday|
#         #     create_list(:event, 3, ddays: dday)
#         # end
#         # event
#     end
#     factory :event do
#         sequence(:id) { |n| n }
#         sequence(:event_name) { |n| "TEST_NAME#{n}"}
#         sequence(:contents) { |n| "TEST_CONTENTS#{n}"}
#         deadline{ Time.local(2020,6,15,12,30,0) }
#         sequence(:organizar) { |n| "TEST_ORGANIZAR#{n}"}
#         # sequence(:event_no) { |n| "TEST_NO#{n}" }
#         multiple_entries{ true }
#         trait :attributes_event do
#             sequence(:id) { |n| n }
#             sequence(:event_no) { |n| "AttributesNO01#{n}"}
#             sequence(:event_name) { |n| "TEST_NAME#{n}"}
#             sequence(:contents) { |n| "TEST_CONTENTS#{n}"}
#             deadline{ Time.local(2020,6,15,12,30,0) }
#             sequence(:organizar) { |n| "TEST_ORGANIZAR#{n}"}
#         end
#     end
# end