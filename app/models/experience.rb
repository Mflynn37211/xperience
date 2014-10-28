class Experience < ActiveRecord::Base

  belongs_to :stadium
  belongs_to :user

  validates :user_id, :stadium_id, :title, :summary,
  presence: true
  validates :food, :atmosphere, :neighborhood, :fans,
  inclusion: { in: 1..5}
  validates :atmosphere,
  inclusion: { in: 1..5}


  def owner?(current_user)
    user == current_user
  end
end
