class PlantsController < ApplicationController
    def index
      plants = Plant.all
      render json: plants
    end
    def show
      plants = Plant.find_by(id: params[:id])
      if plants
        render json: plants
      else
        render json: { error: "Plant not found" }, status: :not_found
      end
    end
  
    def create
      plants = Plant.create(params.permit(:name, :image, :price))
      render json: plants, status: :created
    end
end
