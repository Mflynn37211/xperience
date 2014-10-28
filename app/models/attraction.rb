class Attraction < ActiveRecord::Base
  belongs_to :stadium

  validates :stadium_id, :name, :rating, :url, :location,
    presence: true

end
