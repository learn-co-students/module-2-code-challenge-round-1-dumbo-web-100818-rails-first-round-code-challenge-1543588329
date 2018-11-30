class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end
  def show
    @heroine = Heroine.find(heroine_params[:id])
    puts heroine_params
  end

 def new
   @heroine = Heroine.new
   @powers = Power.all
 end

 def create
   @heroine = Heroine.create(heroine_params)
   render show 
 end


private

def heroine_params
  params.permit(:id, :name, :super_name)
end




end
