class Instagram
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :image_url, type: String
  
  scope :recent_few,  -> { order(created_at: :desc).limit(3) }
  
  after_create :notify_clients
  
  private
  
  def notify_clients
    Pusher.trigger_async('instagram', 'created', {
      image_url: image_url
    })
  end
  
end
