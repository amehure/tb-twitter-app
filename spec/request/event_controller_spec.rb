require "rails_helper"

RSpec.describe EventsController, type: :request do
    describe "GET #index" do
        before do
            @events = create_list(:event,10)
            # before { get events_path }
        end
        it "正常なレスポンスか" do
            get events_path
            # Rails6からbe_successが使えない
            expect(response).to be_successful
        end
        it "リクエストが成功するか" do
            get events_path
            expect(response.status).to eq 200
        end
    end
    describe "GET #show" do
        before do
            @event = create(:event)
            @dday = create(:dday)
            @user = create(:user)
        end
        it "正常なレスポンスか" do
            get event_path(@event.id)
            expect(response).to be_successful
        end
        it "リクエストが成功すること" do
            get event_path(@event.id)
            expect(response.status).to eq 200
        end
    end
end
