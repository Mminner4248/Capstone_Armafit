class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new 
    @user = User.new
  end

  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        if params[:images]
          params[:images].each { |image|
          @user.photos.create(image: image)
        }
        end
        redirect_to root_url, notice: 'Thank you for signing up!'
    else
        render :new
    end
end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def image_params
      params.require(:user).permit(:image_file)
    end

    def user_params
      params.require(:user).permit(:password, :password_confirmation, :image_id, :coach_auth, :first_name, :last_name, :email, :phone, :address, :city, :state, :country, :zip, :gender, :gym_name)
    end
end
