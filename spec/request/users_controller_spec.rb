require "rails_helper"

RSpec.describe UsersController, type: :request do
    before do
        @event = create(:event)
        @dday = Dday.find_by(event_id: @event.id)
        @user = User.find_by(dday_id: @dday.id)
        p "Rspecテスト"
        p @dday
        p Event.all
        p Dday.all
        p User.all
    end
    describe "GET #new" do
        context "正常値の場合" do
            it "正常なレスポンスか" do
                get new_dday_user_path(@dday.id)
                expect(response).to be_successful
            end
            it "リクエストが成功すること" do
                get new_dday_user_path(@dday.id)
                expect(response.status).to eq 200
            end
        end
    end
    describe "GET #edit" do
        context "正常地の場合" do
            before do
                get edit_user_path(@user.id)
            end
            it "正常なレスポンスか" do
                expect(response).to be_successful
            end
            it "リクエストが成功すること" do
                expect(response.status).to eq 200
            end
        end
    end
    describe "POST #create" do
        context "正常な値の場合" do
            before do
                @user = attributes_for(:user, {event_sub_no: @dday.event_sub_no, dday_id:@dday.id, event_no: @dday.event_no})
            end
            it "正常に作成できるか" do
                expect do
                    post dday_users_path(dday_id: @dday.id), params: { user: @user }
                end.to change(User, :count).by(1)
            end
            it "作成後、正常にリダイレクトされているか" do
                post dday_users_path(dday_id: @dday.id), params: { user: @user }
                expect(response).to  redirect_to "/events/#{@dday.event_id}"
            end
        end
        context "不正な値の場合" do
            before do
                @user = attributes_for(:user, {event_sub_no: @dday.event_sub_no, dday_id: @dday.id, event_no: @dday.event_no, twitter_screenname: nil})
            end
            it "リクエストが成功するか" do
                post dday_users_path(dday_id: @dday.id), params: { user: @user }
                expect(response.status).to eq 200
            end
            it "作成失敗するか" do
                expect do
                    post dday_users_path(dday_id: @dday.id), params: { user: @user }
                end.to_not change(User, :count)
            end
            it "エラー後、正常にリダイレクトされているか" do
                post dday_users_path(dday_id: @dday.id), params: { user: @user }
                expect(response).to  render_template :new
            end
        end
    end
    describe "PATCH #update" do
        context "正常な値の場合" do
            before do
                @user_params = {twitter_screenname: "つるぴかはげまる"}
            end
            it "正常に作成できるか" do
                patch user_path(@user.id), params: {user: @user_params}
                expect(@user.reload.twitter_screenname).to eq "つるぴかはげまる"
            end
            it "作成後、正常にリダイレクトされているか" do
                patch user_path(@user.id), params: {user: @user_params}
                expect(response).to  redirect_to "/events/#{@event.id}"
            end
        end
        context "不正な値の場合" do
            before do
                @user_params = {dday_id: @dday.id, twitter_screenname: nil}
            end
            it "リクエストが成功するか" do
                patch user_path(@user.id), params: {user: @user_params}
                expect(response.status).to eq 200
            end
            it "変更失敗するか" do
                patch user_path(@user.id), params: {user: @user_params}
                expect(@user.reload.twitter_screenname).to_not eq nil
            end
            it "エラー後、正常に表示されているか" do
                patch user_path(@user.id), params: {user: @user_params}
                expect(response).to  render_template :edit
            end
        end
    end
    describe "DELETE #update" do
        context "正常な値の場合" do        
            it "正常に削除できるか" do
                expect do
                    delete user_path(@user.id)
                end.to change(User, :count).by(-1)
            end
            it "削除後、正常にリダイレクトできるか" do
                delete user_path(@user.id)
                expect(response).to  redirect_to event_path(@dday.event_id)
            end
        end        
    end
end

