class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
  end

  def show
    @creature = Creature.find(params[:id])
  end

  def new
    @creature = Creature.new
  end

  def create
    Creature.create(creatures_params)
    redirect_to creatures_path
  end

  def edit
    @creature = Creature.find(params[:id])
  end

  def update
    creature = Creature.find(params[:id])
    creature.update_attributes(creatures_params)
    redirect_to creature_path(creature)
  end

  def destroy
    creature = Creature.find_by_id(params[:id])
    creature.destroy
    redirect_to creatures_path
  end



  private

  def creatures_params
    params.require(:creature).permit(:name, :description)
  end


end
