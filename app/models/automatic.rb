class Automatic
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :trip_map, type: String
  field :avg_mpg, type: Float
  field :miles, type: Float
  field :duration, type: String
  field :fuel_volume, type: Float
  
  validates :trip_map, presence: true
  validates :avg_mpg, presence: true
  validates :miles, presence: true
  validates :duration, presence: true
  validates :fuel_volume, presence: true
  
  scope :recent, ->(num) { desc(:created_at).limit(num) }
  
  after_create :notify_clients
  
  paginates_per 20
  
  private
  
  def notify_clients
    Pusher.trigger_async('automatic', 'created', {
      trip_map: trip_map
    })
  end
  
end
