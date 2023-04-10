class EateriesController < ApplicationController
  def index
    @eateries = Eatery.all
  
  end
end
