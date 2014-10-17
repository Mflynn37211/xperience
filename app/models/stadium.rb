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

  def top_hotels
    hotels = []
    hotel_results = Yelp.client.search(self.city, { category_filter: 'hotels', sort: 2, limit: 20 })
    hotel_results.businesses.each do |business|
      hotel_hash = {
        name: business.name,
        rating: business.rating,
        url: business.url,
        location: business.location.display_address.join(", "),
      }
      hotels << hotel_hash
    end
    hotels
  end


  def top_bars
      bars = []
      bar_results = Yelp.client.search(self.city, { category_filter: 'bars', sort: 2, limit: 20 })
      bar_results.businesses.each do |business|
      bar_hash = {
          name: business.name,
          rating: business.rating,
          url: business.url,
          location: business.location.display_address.join(", ")
      }
        bars << bar_hash
      end
      bars
  end

  def top_attractions
      attractions = []
      attraction_results = Yelp.client.search(self.city, { category_filter: 'arts', sort: 2, limit: 20 })
      attraction_results.businesses.each do |business|
      attraction_hash = {
          name: business.name,
          rating: business.rating,
          url: business.url,
          location: business.location.display_address.join(", ")

      }
        attractions << attraction_hash
      end
      attractions
  end
end
