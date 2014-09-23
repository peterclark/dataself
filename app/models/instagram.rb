class Instagram
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :image_url, type: String
  
  validates :image_url, presence: true
  
  scope :recent, ->(num) { desc(:created_at).limit(num) }
  
  after_create :notify_clients
  
  private
  
  def notify_clients
    Pusher.trigger_async('instagram', 'created', {
      image_url: image_url
    })
  end
  
end
