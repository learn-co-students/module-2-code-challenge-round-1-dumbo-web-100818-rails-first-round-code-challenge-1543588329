class HeroinesController < ApplicationController
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
    @heroine = Heroine.create(params.require(:heroine).permit(:name, :super_name, :power_id))
    if @heroine.valid?
      redirect_to heroines_path
    else
      @powers = Power.all
      render 'new'
    end
  end
  def search
    @power = Power.find(:all, :conditions => ["names like ?", params[:q]]).limit(1)
    @heroines = Heroine.where("power_id = ?", @power.id)
  end
end
