class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to users_url, notice: 'User was successfully created.' }
        end
      end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'user was successfully updated.'}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
  end

end
