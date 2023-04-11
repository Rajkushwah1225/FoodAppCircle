class CuisineController < ApplicationController
  
  # def index
  #   @cuisines = Cuisine.all
  #   # if params[:search].present?
  #     #   @cuisines = Cuisine.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
  #     # else
  #     #   Cuisine.all
  #     # end
  # end
  def index
    @cuisines = Cuisine.all
  end

 
  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    if @cuisine.save
      redirect_to @cuisine, notice: "cuisine created successfully"
    else
      render :new
    end
  end

  def edit
    @cuisine = Cuisine.find(params[:id])
  end

  def update
    @cuisine = Restaurant.find(params[:id])
    if @cuisine.update(cuisine_params)
      redirect_to @cuisine, notice: "cuisine updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @cuisine = Cuisine.find(params[:id])
    @cuisine.destroy
    redirect_to cuisine_path, notice: "cuisine deleted successfully"
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end