class MissionsController < ApplicationController

def new
  @mission = Mission.new
end

def create
   @mission = Mission.new(mission_params)
   if @mission.valid?
     @mission.save
     flash[:success] = "Welcome Aboard!! "
     redirect_to mission_path(@mission)
   else
     flash[:my_errors] = @mission.errors.full_messages
     redirect_to new_mission_path
   end
 end





private
  def mission_params
    params.require(:mission).permit(:name, :planet_id, :scientist_id)
  end
end
