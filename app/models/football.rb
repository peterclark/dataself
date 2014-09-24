class Football
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :player, type: String
  field :team, type: String
  field :status, type: String
  field :player_url, type: String
  
  validates :player, presence: true
  validates :team, presence: true
  validates :status, presence: true
  validates :player_url, presence: true
  
  scope :recent, ->(num) { desc(:created_at).limit(num) }
  
  after_create :notify_clients
  
  paginates_per 8
  
  private
  
  def notify_clients
    Pusher.trigger_async('football', 'created', {
      player: player,
      team: team,
      status: status,
      player_url: player_url
    })
  end
end
