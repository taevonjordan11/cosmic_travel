class ScientistsController < ApplicationController


  def index
    @scientists = Scientist.all
  end

  def show
    @scientist = Scientist.find(params[:id])
  end


  private
  def scientist_params
    require(:scientist).permit(:name, :field_of_study)
  end
end
