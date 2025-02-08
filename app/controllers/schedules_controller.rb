class SchedulesController < ApplicationController
    before_action :authenticate_user!

    def show
        day = params[:day].to_i
        schedule = Schedule.includes(activities: :category).find_by(day: day)

        if schedule
            completed_activity_ids = current_user.user_activity_progresses.where(schedule_id: schedule.id).pluck(:activity_id)
            remaining_activities_count = schedule.activities.where.not(id: completed_activity_ids).remaining_activities_count

            schedule_data = {
                day: schedule.day,
                activities: schedule.activities.map do |activity|
                    {
                        id: activity.id,
                        name: activity.name,
                        category: activity.category.name,
                        completed: completed_activity_ids.include?(activity.id)
                    }
                end,
                remaining_count: remaining_activities_count
            }

            render json: schedule_data, status: :ok
        else
            render json: { error: "Schedule not found for this day" }, status: :not_found
        end
    end
end
