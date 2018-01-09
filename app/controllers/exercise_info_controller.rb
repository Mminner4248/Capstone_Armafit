#A controller for the exercise info page, it reads the JSON located in the views folder and parses it into an array of hashes. Search functionality is currently not working.
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

