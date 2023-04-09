class HomeController < ApplicationController
  
  def index
  @cities = City.all
  end
 
  def restro
    @restaurants = Restaurant.all
  end
end



