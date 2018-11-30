class HeroinesController < ApplicationController
  # validate :power, :before => :create
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.create(heroine_params)
    # if @heroine.save
    #     flash[:success]
        redirect_to @heroine
      # else
      #   flash[:alert] = "power taken"
      #   render :new
      # end
  end





  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end




end
