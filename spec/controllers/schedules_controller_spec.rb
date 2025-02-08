require 'rails_helper'

RSpec.describe SchedulesController, type: :controller do
    let(:user) { create(:user) }
    let(:category) { create(:category) }
    let(:activity) { create(:activity, category: category) }
    let(:activity2) { create(:activity, category: category) }
    let(:schedule) { create(:schedule, day: 5) }
    let!(:scheduled_activity) { create(:scheduled_activity, schedule: schedule, activity: activity) }
    let!(:scheduled_activity2) { create(:scheduled_activity, schedule: schedule, activity: activity2) }
    let!(:user_activity_progress) { create(:user_activity_progress, user: user, schedule: schedule, activity: activity) }

    before do
        sign_in user
    end

    describe "GET #show" do
        context "when schedule exists" do
            it "returns the schedule with activities" do
                get :show, params: { day: schedule.day }

                expect(response).to have_http_status(:ok)
                json = JSON.parse(response.body)
                expect(json["day"]).to eq(schedule.day)
            end
        end

        context "when schedule does not exist" do
            it "returns a not found error" do
              get :show, params: { day: 99 }
      
              expect(response).to have_http_status(:not_found)
              json = JSON.parse(response.body)
              expect(json["error"]).to eq("Schedule not found for this day")
            end
        end
    end


    describe "POST #complete_activity" do
        context "when marking an activity as completed" do
            it "successfully marks an activity as completed" do
                post :complete_activity, params: { day: schedule.day, activity_id: activity2.id }
                
                byebug
                expect(response).to have_http_status(:ok)
                json = JSON.parse(response.body)
                expect(json["message"]).to eq("Activity marked as completed")
            end
        end

        context "when activity is already completed" do
            it "returns an error" do
                post :complete_activity, params: { day: schedule.day, activity_id: activity.id }
                post :complete_activity, params: { day: schedule.day, activity_id: activity.id }

                expect(response).to have_http_status(:unprocessable_entity)
                json = JSON.parse(response.body)
                expect(json["error"]).to eq("Activity already completed")
            end
        end
    end
end
