class Github
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :commit_url, type: String
  field :commit_time, type: DateTime
  
  scope :last_month, -> { where(created_at: (30.days.ago..Time.now)) }
  
  after_create :notify_clients
  
  def self.count_by_day
    days_in_month = (1..30).each_with_object( {} ) { |day,hash| hash[day] = 0 }
    last_month.all.inject( days_in_month ) do |counts, github| 
      counts[ github.created_at.day ] += 1
      counts
    end
  end
  
  private
  
  def notify_clients
    Pusher.trigger_async('github', 'created', {
      commit_url: commit_url,
      commit_time: commit_time
    })
  end
  
end
