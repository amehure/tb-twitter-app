require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = build(:user)
  end
  describe "バリデーション" do
    it "正常に保存されるか" do
      # dday = create(:dday)
      # user = build(:user)
      expect(@user).to be_valid
    end
    it "event_noがない場合、無効になるか" do
      @user = build(:user, event_no: nil)
      @user.valid?
      expect(@user.errors[:event_no]).to include("can't be blank")
    end
    it "event_sub_noがない場合、無効になるか" do
      @user = build(:user, event_sub_no: nil)
      @user.valid?
      expect(@user.errors[:event_sub_no]).to include("can't be blank")
    end
    it "serial_noがない場合、無効になるか" do
      @user = build(:user, serial_no: nil)
      @user.valid?
      expect(@user.errors[:serial_no]).to include("can't be blank")
    end
    it "twitter_screennameがない場合、無効になるか" do
      @user = build(:user, twitter_screenname: nil)
      @user.valid?
      expect(@user.errors[:twitter_screenname]).to include("can't be blank")
    end
    it "重複serial_no,event_sub_noを持つ場合、無効になるか" do
      @created_user = create(:user, serial_no: 1, event_sub_no: 1 )
      @user = build(:user, serial_no: 1, event_sub_no: 1 )
      @user.valid?
      expect(@user.errors[:serial_no]).to include("has already been taken")
    end
    it "重複event_sub_noを持つ場合でも、有効になるか" do
      @created_user = create(:user, event_sub_no: 1 )
      @user = build(:user, event_sub_no: 1 )
      expect(@user).to be_valid
    end
  end
end
