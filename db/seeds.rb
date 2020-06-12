# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.create(
    event_id: "IV000001",
    event_name: "オンライン勉強会",
    contents: "DB正規化の演習勉強会",
    days_held: 3,
    organizar: "SmartNao",
    deadline: Time.local(2020,6,15,12,30,0),
    multiple_entries: true
)
Dday.create(
    event_id: "IV000001",
    event_sub_no: "1",
    event_date: Time.local(2020,6,15,22,0,0), 
    decision: nil,
    max_num: 3,
    zoom_url: "",
    zoom_id: "",
    zoom_pass: "",
)
Dday.create(
    event_id: "IV000001",
    event_sub_no: "2",
    event_date: Time.local(2020,6,20,22,0,0), 
    decision: nil,
    max_num: 3,
    zoom_url: "",
    zoom_id: "",
    zoom_pass: "",
)
Dday.create(
    event_id: "IV000001",
    event_sub_no: "3",
    event_date: Time.local(2020,6,27,22,0,0), 
    decision: nil,
    max_num: 3,
    zoom_url: "",
    zoom_id: "",
    zoom_pass: "",
)
User.create(
    event_id: "IV000001",
    event_sub_no: "1",
    serial_no: "",
    twitter_screenname: "ame40s1",
)
User.create(
    event_id: "IV000001",
    event_sub_no: "2",
    serial_no: "",
    twitter_screenname: "ame40s1",
)
User.create(
    event_id: "IV000001",
    event_sub_no: "3",
    serial_no: "",
    twitter_screenname: "ame40s1",
)