class ExerciseInfoController < ApplicationController
    @@exercise_info = File.read("app/views/exercise_info/movement.json")

def index
    @exercise_info = JSON.parse(@@exercise_info)
    if params[:search]
      @exercise_info = @exercise_info.search(params[:search])
    end
   end
end

