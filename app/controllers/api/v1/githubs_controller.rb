class Api::V1::GithubsController < Api::V1::ApiController
  version 1
  
  before_action :set_github, only: [:show]

  def index
    @githubs = Github.all
    expose @githubs
  end

  def show
    expose @github
  end

  def create
    @github = Github.new( github_params )
    @github.save
    expose @github
  end

  private
    def set_github
      @github = Github.find(params[:id])
    end

    def github_params
      params.permit(:commit_url, :commit_time)
    end
end
