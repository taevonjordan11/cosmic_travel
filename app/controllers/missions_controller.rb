class MissionsController < ApplicationController

def new
  @mission = Mission.new

  @scientists = Scientist.all
  @planets = Planet.all
end

def create
   @mission = Mission.new(mission_params)
   if @mission.valid?
     @mission.save
     flash[:success] = "Welcome Aboard!! "
     redirect_to scientist_path(@mission.scientist_id)
   else
     flash[:my_errors] = @mission.errors.full_messages
     redirect_to new_mission_path(@mission)
   end
 end





private
  def mission_params
    params.require(:mission).permit(:name, :planet_id, :scientist_id)
  end
end
