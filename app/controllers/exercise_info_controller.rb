class ExerciseInfoController < ApplicationController
    @@exercise_info = File.read("app/views/exercise_info/movement.json")

    def index
        @exercise_info = JSON.parse(@@exercise_info)

        @user_schedules = 
        if params[:term]
            @exercise_info.search(params[:term])
        else
            @exercise_info = JSON.parse(@@exercise_info)
        end
    end
end

