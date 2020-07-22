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
     @scientist = Scientist.new(scientist_params)
     if @scientist.valid?
       @scientist.save
       flash[:success] = "Welcome Aboard!! "
       redirect_to scientist_path(@scientist)
     else
       flash[:my_errors] = @scientist.errors.full_messages
       redirect_to new_scientist_path
     end
   end

   def edit
     @scientist = Scientist.find(params[:id])
   end

   def update
     @scientist = Scientist.find(params[:id])
     @scientist.update(scientist_params)

     redirect_to scientist_path(@scientist)
   end

   def destroy
     @scientist = Scientist.find(params[:id])
     @scientist.destroy

     redirect_to scientists_path
   end


  private
  def scientist_params
    params.require(:scientist).permit(:name, :field_of_study)
  end
end
