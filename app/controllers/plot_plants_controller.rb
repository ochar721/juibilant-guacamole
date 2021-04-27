class PlotPlantsController < ApplicationController

  def destroy
    remove_plant = PlotPlant.find_by(plot_id: params[:id], plant_id: params[:format])
    remove_plant.destroy
    redirect_to "/plots"
  end
end
