class Instagram < ActiveRecord::Base
  
  after_create :notify_clients
  
  private
  
  def notify_clients
    Pusher.trigger_async('instagrams', 'created', {
      message: 'An instagram was created.'
    })
  end
  
end
