class ExperiencesController < ActionController::Base
  before_filter :authenticate_user!

  def new
    @experiences = Experience.new
  end

  def edit
    @experience = Experience.find(params[:id])
    @stadium = Stadium.find(stadium_id)
  end

  def update
    @experience= Experience.find(params[:id])
    if @experience.update(experience_params)
      flash[:notice]= "Experience updated successfully"
      redirect_to stadium_path(params[:stadium_id])
    end
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.stadium_id = params[:stadium_id]
    @experience.user_id = current_user.id


    if @experience.save
      flash[:notice]= "Experience created successfully"
      redirect_to stadium_path(params[:stadium_id])
    else
      flash[:notice]= "You didn't enter enough information."
      redirect_to stadium_path(params[:stadium_id])
    end
  end

private

  def experience_params
    params.require(:experience).permit(:title, :summary, :food, :atmosphere, :neighborhood, :fans)
  end

end
