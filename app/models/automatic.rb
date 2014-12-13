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
  end
  
  def meters
  end
  
  def gallons
  end
  
  private
  
  def set_trip_map_url
    map_url = [MAP_URL, "scale=2&path=enc:", trip['path'], "&size=600x600&sensor=false"].join
    bitly = Bitly.client.shorten( map_url )
    self.trip_map_url = bitly.short_url
  end
  
  def notify_clients
    Pusher.trigger_async('automatic', 'created', {
      trip_map_url: trip_map_url
    })
  end
  
end
