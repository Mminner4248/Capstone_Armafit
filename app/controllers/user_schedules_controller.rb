class UserSchedulesController < ApplicationController
  before_action :set_user_schedule, only: [:show, :edit, :update, :destroy]

  # GET /user_schedules
  def index
    #allows user to search schedule based on search term. Otherwise it shows all user_schedules that have same user_id as user. 
    @user_schedules = 
    if params[:term]
      @user_schedules = UserSchedule.search(params[:term])
    else
      @user_schedules = UserSchedule.where(user_id: current_user.id)
    end
    
  end
  
  # GET /user_schedules/new
  #when user selects a created schedule, it populates the modal with data from schedule database. 
  def new
    @user_schedule = UserSchedule.new
    @schedule = Schedule.find(params[:schedule])
    @user_list = @schedule.users 
  end

  # GET /user_schedules/1/edit
  def edit
  end

  # POST /user_schedules
  def create
    @user_schedule = UserSchedule.create(user_schedule_params)
    redirect_to root_url
  end

  # PATCH/PUT /user_schedules/1
  def update
    @user_schedule.update(user_schedule_params)
    redirect_to root_url
  end

  # DELETE /user_schedules/1
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
      params.require(:user_schedule).permit(:schedule_id, :user_id, :user_notes, :attended, :term)
    end
end
