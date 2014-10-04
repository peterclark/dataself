class Automatic
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :trip_map, type: String
  
  validates :trip_map, presence: true
  
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
