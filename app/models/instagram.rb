class Instagram < ActiveRecord::Base
  
  scope :recent, -> { order(created_at: :desc).first }
  
  after_create :notify_clients
  
  private
  
  def notify_clients
    Pusher.trigger_async('instagrams', 'created', {
      message: 'An instagram was created.'
    })
  end
  
end
