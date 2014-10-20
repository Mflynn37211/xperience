class SeatsController < ActionController::Base
  before_filter :authenticate_user!

  def new
    @seats = Seat.new
  end

  def edit
    @seat= Seat.find(params[:id])
    @stadium = Stadium.find(stadium_id)
  end

  def update
    @seat= Seat.find(params[:id])
    if @seat.update(seat_params)
      flash[:notice]= "Seats updated successfully"
      redirect_to stadium_path(params[:stadium_id])
    end
  end

  def create
    @seat = Seat.new(seat_params)
    @seat.stadium_id = params[:stadium_id]
    @seat.user_id = current_user.id


    if @seat.save
      flash[:notice]= "Seat created successfully"
      redirect_to stadium_path(params[:stadium_id])
    else
      flash[:notice]= "You didn't enter enough information."
      redirect_to stadium_path(params[:stadium_id])
    end
  end

private

  def seat_params
    params.require(:seat).permit(:section, :row, :seat_number, :seat_description)
  end

end
