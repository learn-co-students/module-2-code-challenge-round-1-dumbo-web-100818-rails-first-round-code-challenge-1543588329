require 'byebug'
class HeroinesController < ApplicationController

  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def show
    @heroine = Heroine.find(params[:id])
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    # byebug
    if @heroine.save
      render :show
    else
      flash[:error] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
