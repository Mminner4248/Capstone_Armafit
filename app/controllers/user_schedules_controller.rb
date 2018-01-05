class UserSchedulesController < ApplicationController
  before_action :set_user_schedule, only: [:show, :edit, :update, :destroy]

  # GET /user_schedules
  # GET /user_schedules.json
  def index
    @user_schedules = UserSchedule.all
  end

  # GET /user_schedules/1
  # GET /user_schedules/1.json
  def show
  end 

  # GET /user_schedules/new
  def new
    @user_schedule = UserSchedule.new
    @schedule = Schedule.find(params[:schedule])
    @user_list = @schedule.users 
  end

  # GET /user_schedules/1/edit
  def edit
  end

  # POST /user_schedules
  # POST /user_schedules.json
  def create
    @user_schedule = UserSchedule.create(user_schedule_params)
    redirect_to root_url
  end

  # PATCH/PUT /user_schedules/1
  # PATCH/PUT /user_schedules/1.json
  def update
    @user_schedule.update(user_schedule_params)
    redirect_to root_url
  end

  # DELETE /user_schedules/1
  # DELETE /user_schedules/1.json
  def destroy
    @user_schedule.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_schedule
      @user_schedule = UserSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_schedule_params
      params.require(:user_schedule).permit(:schedule_id, :user_id, :user_notes, :attended)
    end
end
