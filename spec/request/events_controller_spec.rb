require "rails_helper"

RSpec.describe EventsController, type: :request do
    before do
        @event = create(:event)
    end
    describe "GET #index" do
        before do
            get events_path
        end
        it "正常なレスポンスか" do
            # Rails6からbe_successが使えない
            expect(response).to be_successful
        end
        it "リクエストが成功するか" do
            expect(response.status).to eq 200
        end
    end
    describe "GET #show" do
        before do
            get event_path(@event.id)
        end
        it "正常なレスポンスか" do
            expect(response).to be_successful
        end
        it "リクエストが成功すること" do
            expect(response.status).to eq 200
        end
    end
    describe "GET #new" do
        context "正常地の場合" do
            before do
                get new_event_path
            end
            it "正常なレスポンスか" do
                expect(response).to be_successful
            end
            it "リクエストが成功すること" do
                expect(response.status).to eq 200
            end
        end
    end
    describe "GET #edit" do
        context "正常地の場合" do
            before do
                get edit_event_path(@event.id)
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
                @event = attributes_for(:event, :attributes_event)
            end
            it "正常に作成できるか" do
                expect do
                    post events_path(event: @event)
                end.to change(Event, :count).by(1)
            end
            it "作成後、正常にリダイレクトされているか" do
                post events_path(event: @event)
                event = Event.find_by(event_no: @event[:event_no])
                expect(response).to  redirect_to "/events/#{event.id}"
            end
        end
        context "不正な値の場合" do
            before do
                @event = attributes_for(:event, :attributes_event, event_no: nil)
            end
            it "リクエストが成功するか" do
                post events_path(event: @event)
                expect(response.status).to eq 200
            end
            it "作成失敗するか" do
                expect do
                    post events_path(event: @event)
                end.to_not change(Event, :count)
            end
            it "エラー後、正常にリダイレクトされているか" do
                post events_path(event: @event)
                expect(response).to  render_template :new
            end
        end
    end
    describe "PATCH #update" do
        context "正常な値の場合" do
            before do
                @event_params = {contents: "宴会"}
            end
            it "正常に作成できるか" do
                patch event_path(@event.id), params: {event: @event_params}
                expect(@event.reload.contents).to eq "宴会"
            end
            it "作成後、正常にリダイレクトされているか" do
                patch event_path(@event.id), params: {event: @event_params}
                expect(response).to  redirect_to "/events/1"
            end
        end
        context "不正な値の場合" do
            before do
                @event_params = {event_no: nil}
            end
            it "リクエストが成功するか" do
                patch event_path(@event.id), params: {event: @event_params}
                expect(response.status).to eq 200
            end
            it "変更失敗するか" do
                patch event_path(@event.id), params: {event: @event_params}
                expect(@event.reload.event_no).to eq @event.event_no
            end
            it "エラー後、正常にリダイレクトされているか" do
                patch event_path(@event.id), params: {event: @event_params}
                expect(response).to  render_template :edit
            end
        end
    end
    describe "DELETE #update" do
        context "正常な値の場合" do        
            it "正常に削除できるか" do
                expect do
                    delete event_path(@event.id)
                end.to change(Event, :count).by(-1)
            end
            it "削除後、正常にリダイレクトできるか" do
                delete event_path(@event.id)
                expect(response).to  redirect_to events_path
            end
        end        
    end
end

