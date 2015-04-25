class Github
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :commit_url, type: String
  field :commit_time, type: DateTime
  
  validates :commit_url, presence: true
  validates :commit_time, presence: true
  
  scope :last_month, -> { where(created_at: (30.days.ago..Time.now)) }
  scope :last_year, -> { where(created_at: (1.year.ago..Time.now)) }
  scope :recent, -> { desc(:created_at) }
  
  after_create :notify_clients
  
  paginates_per 12
  
  def self.count_by_day
    days_in_month = (1..30).each_with_object( {} ) { |day,hash| hash[day] = 0 }
    last_month.all.inject( days_in_month ) do |counts, github| 
      counts[ github.created_at.day ] += 1
      counts
    end
  end
  
  def self.count_by_month
    months_in_year = (1..12).each_with_object( {} ) { |month,hash| hash[month] = 0 }
    last_year.all.inject( months_in_year ) do |counts, github| 
      counts[ github.created_at.month ] += 1
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
