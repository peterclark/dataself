class Automatic
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :trip_map, type: String
  
  validates :trip_map, presence: true
  
end
