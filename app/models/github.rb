class Github
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :commit_url, type: String
end
