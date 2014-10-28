class Stadium < ActiveRecord::Base
  has_many :experiences
  has_many :seats

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

    paginates_per 4

  def self.search(query)
    where("state ilike ?", "%#{query}%")
  end

  def top_hotels
    hotels = []
    hotel_results = Yelp.client.search(self.city, { category_filter: 'hotels', sort: 2, limit: 20 })
    hotel_results.businesses.each do |business|
      hotel_hash = {
        name: business.name,
        rating: business.rating,
        url: business.url,
        location: business.location.display_address.join(", "),
        image_url: business.respond_to?(:image_url) ? business.image_url : "https://s3.amazonaws.com/breakabletoy-stadiums/default.jpeg",
        display_phone: business.respond_to?(:display_phone) ? business.phone : "No phone number available"
      }
      hotels << hotel_hash
    end
    hotels.sort_by {|h| h[:rating]}.reverse
  end

  def top_bars
      bars = []
      bar_results = Yelp.client.search(self.city, { category_filter: 'bars', sort: 2, limit: 20 })
      bar_results.businesses.each do |business|
      bar_hash = {
          name: business.name,
          rating: business.rating,
          url: business.url,
          location: business.location.display_address.join(", "),
          image_url: business.respond_to?(:image_url) ? business.image_url : "https://s3.amazonaws.com/breakabletoy-stadiums/default.jpeg",
          display_phone: business.respond_to?(:display_phone) ? business.phone : "No phone number available"
      }
        bars << bar_hash
      end
      bars.sort_by {|h| h[:rating]}.reverse

  end

  def top_attractions
      attractions = []
      attraction_results = Yelp.client.search(self.city, { category_filter: 'arts', sort: 2, limit: 20 })
      attraction_results.businesses.each do |business|
      attraction_hash = {
          name: business.name,
          rating: business.rating,
          url: business.url,
          location: business.location.display_address.join(", "),
          image_url: business.respond_to?(:image_url) ? business.image_url : "https://s3.amazonaws.com/breakabletoy-stadiums/default.jpeg",
          display_phone: business.respond_to?(:display_phone) ? business.phone : "No phone number available"
      }
        attractions << attraction_hash
      end
      attractions.sort_by {|h| h[:rating]}.reverse
  end
end
