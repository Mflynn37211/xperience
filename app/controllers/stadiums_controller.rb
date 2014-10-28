class StadiumsController < ApplicationController
  def index
   @stadiums = Stadium.order(name: :asc).page params[:page]

   if params[:search]
      @stadiums = Stadium.search(params[:search]).order("name").page(params[:page])
    else
      Stadium.order("name").page(params[:page])
   end
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
