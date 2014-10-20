class StadiumsController < ApplicationController
  def index
   @stadiums = Stadium.order(state: :asc).page params[:page]
  end

  def show
    @stadium = Stadium.find(params[:id])
    @experiences = @stadium.experiences.order(created_at: :desc)
    @experience = Experience.new
    @seats = @stadium.seats.order(created_at: :desc)
    @seat = Seat.new
    @hotels = @stadium.top_hotels
    @bars = @stadium.top_bars
    @attractions = @stadium.top_attractions
  end
end
