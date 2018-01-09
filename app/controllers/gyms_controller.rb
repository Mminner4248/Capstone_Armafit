class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]

  # GET /gyms
  def index
    @gyms = Gym.order(:gym_name).where("name like ?", "%#{params[:term]}%")
    render json: @gyms.map(&:gym_name)
  end

  # GET /gyms/new
  def new
    @gym = Gym.new
  end

  # POST /gyms
  #contains part of the autocomplete functionality and global variable current_user takes the newly created gym_id.
  def create
    puts gym_params
    puts params
    @gym = Gym.find_or_create_by(gym_params)
    current_user.update_attribute(:gym_id, @gym.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gym
      @gym = Gym.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gym_params
      params.require(:gym).permit(:gym_name)
    end
end
