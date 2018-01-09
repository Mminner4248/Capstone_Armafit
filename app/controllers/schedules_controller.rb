class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  #shows schedules on FullCalendar that share the same gym_id as user. 
  def index
    @schedules = Schedule.where(gym_id: current_user.gym_id)
  end

  
  def show
  end

  # GET /schedules/new
  #start time takes in date from selected Calendar.
  def new
    @schedule = Schedule.new
    @start_time = DateTime.parse(params[:date])
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      @schedule.update_attribute(:gym_id, current_user.gym_id)
    end
    redirect_to root_url
  end

  # PATCH/PUT /schedules/1
  def update
   @schedule.update(schedule_params)
   redirect_to root_url
  end

  # DELETE /schedules/1
  def destroy
    @schedule.destroy
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:gym_id, :title, :description, :start_time, :end_time, :color)
    end
end
