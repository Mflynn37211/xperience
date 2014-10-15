class Experience < ActiveRecord::Base

  belongs_to :stadiums
  belongs_to :users

  validates :user_id,
  presence: true
  validates :stadium_id,
  presence: :true
  validates :title,
  presence: :true
  validates :summary,
  presence: :true
  validates :food,
  inclusion: { in: 1..5}
  validates :atmosphere,
  inclusion: { in: 1..5}
  validates :neighborhood,
  inclusion: { in: 1..5}
  validates :fans,
  inclusion: { in: 1..5}
end
