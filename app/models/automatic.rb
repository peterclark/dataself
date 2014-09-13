class Automatic
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :trip_map, type: String
  
  validates :trip_map, presence: true
  
  scope :recent_few, -> { order(created_at: :desc).limit(3) }
  
end
