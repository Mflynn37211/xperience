class StadiumsController < ApplicationController
  def index
   @stadiums = Stadium.all
  end

  def show
   @stadium = Stadium.find(params[:id])
   @experiences = @stadium.experiences.order(created_at: :desc)
   @experience = Experience.new
  end
end
