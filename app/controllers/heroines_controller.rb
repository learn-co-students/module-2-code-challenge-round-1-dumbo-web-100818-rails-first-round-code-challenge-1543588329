class HeroinesController < ApplicationController

  before_action :find_heroine, only:[:show, :edit, :update, :destroy]



  def index
    @heroines = Heroine.all
    # @power = Power.find(params[:id])
  end

  def show

  end

  def create
    @heroine = Heroine.new(heroine_params)
    # byebug
    if @heroine.save
      redirect_to @heroine
    else
      @powers=Power.all
      render 'new'
    end
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
    #code
  end



  private
  def find_heroine
    @heroine=Heroine.find(params[:id])
  end

  #
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end


end
