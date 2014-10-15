class Stadium < ActiveRecord::Base

  has_many :experiences


  validates :name,
    presence: true
  validates :city,
    presence: true
  validates :state,
    presence: true
  validates :capacity,
    presence: true
  validates :playing_surface,
    presence: true
  validates :roof_type,
    presence: true
  validates :team,
    presence: true
  validates :year,
    presence: true
end
