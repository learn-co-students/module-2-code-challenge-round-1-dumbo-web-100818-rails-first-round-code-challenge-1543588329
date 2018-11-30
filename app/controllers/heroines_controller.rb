class HeroinesController < ApplicationController
  before_action :find_heroine, only:[:show, :update]

  def index
    @heroines = Heroine.all
  end

  def show

  end

  def new
    @heroine = Heroine.new
  end

  def create
    @powers = Power.all

    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroines_path
    else
      render :new
    end 
  end

  def update
    @heroine = Heroine.create
    @powers = Power.all
  end

  private
    def find_heroine
      @heroine = Heroine.find(params[:id])
    end

    def heroine_params
      params.require(:heroine).permit(:name, :super_name, :power_id)
    end
end
