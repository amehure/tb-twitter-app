require "rails_helper"

RSpec.describe DdaysController, type: :request do
    before do
        # spec/factories/user associationでDdayとEventに関連設定
        @event = create(:event)
        @dday = Dday.find_by(event_id: @event.id)
    end
    describe "GET #new" do
        context "正常値の場合" do
            it "正常なレスポンスか" do
                get new_event_dday_path(@event.id)
                expect(response).to be_successful
            end
            it "リクエストが成功すること" do
                get new_event_dday_path(@event.id)
                expect(response.status).to eq 200
            end
        end
    end
    describe "GET #edit" do
        context "正常地の場合" do
            before do
                get edit_dday_path(@dday.id)
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
                @dday = attributes_for(:dday, {event_id:@event.id,event_no: @event.event_no, event_sub_no: 2})
            end
            it "正常に作成できるか" do
                expect do
                    post event_ddays_path(event_id: @event.id), params: { dday: @dday }
                end.to change(Dday, :count).by(1)
            end
            it "作成後、正常にリダイレクトされているか" do
                post event_ddays_path(event_id: @event.id), params: { dday: @dday }
                expect(response).to  redirect_to "/events/#{@event.id}"
            end
        end
        context "不正な値の場合" do
            before do
                @dday = attributes_for(:dday, {event_id:@event.id, max_num:nil, event_no: @event.event_no})
            end
            it "リクエストが成功するか" do
                post event_ddays_path(event_id: @event.id), params: { dday: @dday }
                expect(response.status).to eq 200
            end
            it "作成失敗するか" do
                expect do
                    post event_ddays_path(event_id: @event.id), params: { dday: @dday }
                end.to_not change(Event, :count)
            end
            it "エラー後、正常にリダイレクトされているか" do
                post event_ddays_path(event_id: @event.id), params: { dday: @dday }
                expect(response).to  render_template :new
            end
        end
    end
    describe "PATCH #update" do
        context "正常な値の場合" do
            before do
                @event_id = @event.id
                @dday_params = {decision: "宴会"}
            end
            it "正常に作成できるか" do
                patch dday_path(@dday.id), params: {dday: @dday_params}
                expect(@dday.reload.decision).to eq "宴会"
            end
            it "作成後、正常にリダイレクトされているか" do
                patch dday_path(@dday.id), params: {dday: @dday_params}
                expect(response).to  redirect_to "/events/#{@event_id}"
            end
        end
        context "不正な値の場合" do
            before do
                @event_id = @event.id
                @dday_params = {event_sub_no: nil}
            end
            # it "リクエストが成功するか" do
            #     patch dday_path(@dday.id), params: {dday: @dday_params}
            #     expect(response.status).to eq 200
            # end
            it "変更失敗するか" do
            patch dday_path(@dday.id), params: {dday: @dday_params}
            expect(@dday.reload.event_sub_no).to_not eq nil
            end
    #         it "エラー後、正常にリダイレクトされているか" do
    #             patch event_path(@event.id), params: {event: @event_params}
    #             expect(response).to  render_template :edit
    #         end
        end
    end
    describe "DELETE #update" do
        before do
            @event_id = @event.id
        end
        context "正常な値の場合" do        
            it "正常に削除できるか" do
                expect do
                    delete dday_path(@dday.id)
                end.to change(Dday, :count).by(-1)
            end
            it "削除後、正常にリダイレクトできるか" do
                delete dday_path(@dday.id)
                expect(response).to  redirect_to event_path(@event_id)
            end
        end        
    end
end

