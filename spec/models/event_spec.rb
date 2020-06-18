require 'rails_helper'

RSpec.describe Event, type: :model do

  it "正常に保存されるか" do
    event = create(:event)
    expect(event).to be_valid
  end
  it "event_nameがない場合、無効になるか" do
    event = build(:event, event_name: nil)
    event.valid?
    expect(event.errors[:event_name]).to include("can't be blank")
  end
  it "event_noがない場合、無効になるか" do
    event = build(:event, event_no: nil)
    event.valid?
    expect(event.errors[:event_no]).to include("can't be blank")
  end
  it "organizarがない場合、無効になるか" do
    event = build(:event, organizar: nil)
    event.valid?
    expect(event.errors[:organizar]).to include("can't be blank")
  end
  it "deadlineがない場合、無効になるか" do
    event = build(:event, deadline: nil)
    event.valid?
    expect(event.errors[:deadline]).to include("can't be blank")
  end
  it "multiple_entriesがない場合、無効になるか" do
    event = build(:event, multiple_entries: nil)
    event.valid?
    expect(event.errors[:multiple_entries]).to include("can't be blank")
  end
  it "重複event_noを持つ場合、無効になるか" do
    event1 = create(:event, event_no: "IV000001")
    event2 = build(:event, event_no: "IV000001")
    event2.valid?
    expect(event2.errors[:event_no]).to include("has already been taken")
  end
end