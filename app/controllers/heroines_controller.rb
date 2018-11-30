class HeroinesController < ApplicationController
  def index

    if params['/heroines'] != nil

      @heroines = Heroine.all.select{|t|t.power.name == params['/heroines']['q']}

      render :index
    else
      @heroines = Heroine.all
      render :index
    end
  end

  # def search
  #
  #   @heroines = Heroine.all.select{|t|t.power == params[:q]}
  #   redirect_to :search
  # end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.create(heroine_params)
    redirect_to @heroine
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
