require 'rails_helper'

RSpec.describe Dday, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    event = create(:event)
  end
  describe "バリデーション" do
    it "正常に保存されるか" do
      dday = build(:dday)
      expect(dday).to be_valid
    end
    it "event_noがない場合、無効になるか" do
      dday = build(:dday, event_no: nil)
      dday.valid?
      expect(dday.errors[:event_no]).to include("can't be blank")
    end
    it "event_sub_noがない場合、無効になるか" do
      dday = build(:dday, event_sub_no: nil)
      dday.valid?
      expect(dday.errors[:event_sub_no]).to include("can't be blank")
    end
    it "event_dateがない場合、無効になるか" do
      dday = build(:dday, event_date: nil)
      dday.valid?
      expect(dday.errors[:event_date]).to include("can't be blank")
    end
    it "max_numがない場合、無効になるか" do
      dday = build(:dday, max_num: nil)
      dday.valid?
      expect(dday.errors[:max_num]).to include("can't be blank")
    end
  end
end
