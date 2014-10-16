class StadiumsController < ApplicationController
  def index
   @stadiums = Stadium.all
  end

  def show
    @stadium = Stadium.find(params[:id])
    @experiences = @stadium.experiences.order(created_at: :desc)
    @experience = Experience.new
    @hotels = @stadium.top_hotels
    @bars = @stadium.top_bars
    @attractions = @stadium.top_attractions
  end
end
