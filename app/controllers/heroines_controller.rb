class HeroinesController < ApplicationController

  before_action :find_heroine, only: [:show, :edit, :update]

  def index
    @heroines = Heroine.all
    @powers = Power.all
    if params[:search]
      @heroines = Heroine.search(params[:search]).order("created_at DESC")
    else
      @heroines = Heroine.all.order('created_at DESC')
    end
  end

  def show
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else
      flash[:error] = @heroine.errors.full_messages
      redirect_to new_heroine_path(@heroine)
    end
  end

  def edit
  end

  def update
    if @heroine.update
      redirect_to @heroine
    else
      flash[:error] = @heroine.errors.full_messages
      redirect_to edit_heroine_path(@heroine)
    end
  end

  private

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
