class ScientistsController < ApplicationController


  def index
    @scientists = Scientist.all
  end

  def show
    @scientist = Scientist.find(params[:id])
  end

  def new
    @scientist = Scientist.new
  end

  def create
     @scientist = Scientist.create(scientist_params)
     if @scientist.valid?
       flash[:success] = "SWEET NEW ITEM"
       redirect_to item_path(@scientist)
     else
       flash[:my_errors] = @scientist.errors.full_messages
       redirect_to new_scientist_path 
     end
   end


  private
  def scientist_params
    require(:scientist).permit(:name, :field_of_study)
  end
end
