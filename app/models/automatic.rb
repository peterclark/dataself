class Automatic
  include Mongoid::Document
  include Mongoid::Timestamps
  
  MAP_URL = "http://maps.googleapis.com/maps/api/staticmap?"
  
  field :trip, type: Hash, default: {}
  field :trip_map_url, type: String
  
  scope :recent, ->(num) { desc(:created_at).limit(num) }
  
  before_create :set_trip_map_url
  after_create :notify_clients
  
  paginates_per 20
  
  def mpg
    trip_object.average_mpg.to_f rescue -1
  end
  
  def miles
    (trip_object.distance_m.to_f / 1609.34) rescue -1
  end
  
  def gallons
    trip_object.fuel_volume_gal.to_f rescue -1
  end
  
  def trip_object
    Hashie::Mash.new( self.trip )
  end
  
  private
  
  def set_trip_map_url
    map_url = [MAP_URL, "scale=2&path=enc:", trip['path'], "&size=600x600&sensor=false"].join
    bitly = Bitly.client.shorten( map_url )
    self.trip_map_url = bitly.short_url
  end
  
  def notify_clients
    Pusher.trigger_async('automatic', 'created', {
      trip_map_url: trip_map_url,
      mpg: mpg,
      miles: miles,
      gallons: gallons
    })
  end
  
end
