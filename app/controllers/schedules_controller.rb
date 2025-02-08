class SchedulesController < ApplicationController
    before_action :authenticate_user!

    def show
        day = params[:day].to_i
        direction = params[:direction]

        if direction.present?
            if direction == "next"
                day += 1
            elsif direction == "prev"
                day -= 1
            end

            day = 1 if day < 1
            day = 30 if day > 30
        end

        schedule = Schedule.includes(activities: :category).find_by(day: day)

        if schedule
            completed_activity_ids = current_user.user_activity_progresses.where(schedule_id: schedule.id).pluck(:activity_id)
            remaining_activities_count = schedule.activities.where.not(id: completed_activity_ids).count

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


    def complete_activity
        day = params[:day].to_i
        activity_id = params[:activity_id].to_i

        schedule = Schedule.find_by(day: day)
        return render json: { error: "Schedule not found for this day" }, status: :not_found unless schedule
        
        activity = schedule.activities.find_by(id: activity_id)
        return render json: { error: "Activity not found in the schedule" }, status: :not_found unless activity

        existing_completion = current_user.user_activity_progresses.find_by(schedule_id: schedule.id, activity_id: activity_id)

        if existing_completion
            render json: { error: "Activity already completed" }, status: :unprocessable_entity
        else
            completion = current_user.user_activity_progresses.new(schedule_id: schedule.id, activity_id: activity_id)
            if completion.save
              render json: { message: "Activity marked as completed" }, status: :ok
            else
              render json: { errors: completion.errors.full_messages }, status: :unprocessable_entity
            end
        end
    end
end
