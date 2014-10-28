class Seat < ActiveRecord::Base

  belongs_to :stadium
  belongs_to :user

  validates :user_id, presence: true
  validates :stadium_id, presence: :true
  validates :section, presence: :true, length: { maximum: 5 }
  validates :row, presence: :true, length: { maximum: 5 }
  validates :seat_number, presence: :true, length: { maximum: 5 }
  validates :seat_description, presence: :true, length: { maximum: 200 }

  def owner?(current_user)
    user == current_user
  end

end
