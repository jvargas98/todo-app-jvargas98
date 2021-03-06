class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def index
    @user = current_user
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to profile_path, notice: "Profile was successfully updated." }
        format.json { render :index, status: :created, location: current_user }
      else
        format.html { render :index }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:avatar, :first_name, :last_name, :description)
  end
end
