class Github
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :commit_url, type: String
  field :commit_time, type: DateTime
end
