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
  
  def commits_by_day
    @commits = Github.count_by_day
    render_json @commits
  end
  
  def commits_by_month
    @commits = Github.count_by_month
    render_json @commits
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
