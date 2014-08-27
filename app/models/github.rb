class Github
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :commit_url, type: String
  field :commit_time, type: DateTime
  
  scope :last_month, -> { where(created_at: (30.days.ago..Time.now)) }
  
  def self.count_by_day
    days_in_month = (1..30).each_with_object( {} ) { |day,hash| hash[day] = 0 }
    last_month.all.inject( days_in_month ) do |counts, github| 
      counts[ github.created_at.day ] += 1
      counts
    end
  end
  
end
